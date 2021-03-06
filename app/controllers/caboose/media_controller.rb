
module Caboose
  class MediaController < ApplicationController
    
    helper :application
    
    def before_action
      @page = Page.page_with_uri(request.host_with_port, '/admin')
    end    
    
    # @route GET /admin/media
    def admin_index
      return if !user_is_allowed('media', 'view')
      render :file => 'caboose/extras/error_invalid_site' and return if @site.nil?
                 
      config = YAML.load(File.read(Rails.root.join('config', 'aws.yml')))[Rails.env]      
      access_key = config['access_key_id']
      secret_key = config['secret_access_key']
      bucket     = config['bucket']
      bucket = Caboose::uploads_bucket && Caboose::uploads_bucket.strip.length > 0 ? Caboose::uploads_bucket : "#{bucket}-uploads"       
      policy = {        
        "expiration" => 1.hour.from_now.utc.xmlschema,
        "conditions" => [
          { "bucket" => bucket },          
          { "acl" => "public-read" },
          [ "starts-with", "$key", '' ],
          #[ "starts-with", "$Content-Type", "" ],
          [ 'starts-with', '$name', '' ], 	
          [ 'starts-with', '$Filename', '' ],          
        ]
      }
      @policy = Base64.encode64(policy.to_json).gsub(/\n/,'')      
      @signature = Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest::Digest.new('sha1'), secret_key, @policy)).gsub("\n","")
      @s3_upload_url = "https://#{bucket}.s3.amazonaws.com/"
      @aws_access_key_id = access_key                            
      
      id = params[:media_category_id]        
      @top_media_category = MediaCategory.top_category(@site.id)
      @media_category = id ? MediaCategory.find(id) : @top_media_category
      render :layout => 'caboose/admin'      
    end
    
    # @route GET /admin/media/policy
    def admin_policy
      return if !user_is_allowed('media', 'view')
      
      config = YAML.load(File.read(Rails.root.join('config', 'aws.yml')))[Rails.env]      
      access_key = config['access_key_id']
      secret_key = config['secret_access_key']
      bucket     = config['bucket']      
      policy = {        
        "expiration" => 1.hour.from_now.utc.xmlschema,
        "conditions" => [
          { "bucket" => "#{bucket}-uploads" },          
          { "acl" => "public-read" },
          [ "starts-with", "$key", '' ],
          #[ "starts-with", "$Content-Type", 'image/' ],          
          [ 'starts-with', '$name', '' ], 	
          [ 'starts-with', '$Filename', '' ],          
        ]
      }
      policy = Base64.encode64(policy.to_json).gsub(/\n/,'')
      render :json => {
        :policy             => policy,      
        :signature          => Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest::Digest.new('sha1'), secret_key, policy)).gsub("\n",""),      
        :s3_upload_url      => "https://#{bucket}-uploads.s3.amazonaws.com/",
        :aws_access_key_id  => access_key,
        :top_media_category => Caboose::MediaCategory.top_category(@site.id),
      }
    end
    
    # @route GET /admin/media/json
    def admin_json
      return if !user_is_allowed('media', 'view')
      render :json => false and return if @site.nil?
      arr = Media.where(:media_category_id => params[:media_category_id]).reorder(:sort_order).all
      render :json => arr.collect{ |m| m.api_hash }                  
    end
    
    # @route GET /admin/media/:id/json
    def admin_json_single
      return if !user_is_allowed('media', 'view')
      render :json => false and return if @site.nil?
      m = Media.where(:id => params[:id]).first
      render :json => m.api_hash      
    end
    
    # @route GET /admin/media/last-upload-processed
    def admin_last_upload_processed
      return if !user_is_allowed('media', 'view')
      render :json => false and return if @site.nil?
      #Setting.where(:site_id => @site.id, :name => 'last_upload_processed').destroy_all      
      s = Setting.where(:site_id => @site.id, :name => 'last_upload_processed').first      
      s = Setting.create(:site_id => @site.id, :name => 'last_upload_processed', :value => DateTime.now.utc.strftime("%FT%T%z")) if s.nil?                  
      render :json => { :last_upload_processed => s.value }
    end

    # @route GET /admin/media/new
    def admin_new
      return unless user_is_allowed('media', 'add')
      @media_category_id = params[:media_category_id]             
      render :layout => 'caboose/admin'
    end
    
    # @route GET /admin/media/:id/description
    def admin_edit_description
      return unless user_is_allowed('media', 'edit')
      @media = Media.find(params[:id])
      render :layout => 'caboose/modal'
    end
    
    # @route GET /admin/media/:id
    def admin_edit
      return unless user_is_allowed('media', 'edit')
      @media = Media.find(params[:id])
      render :layout => 'caboose/admin'
    end
                    
    # @route PUT /admin/media/:id
    def admin_update
      return unless user_is_allowed('media', 'edit')
      
      resp = StdClass.new({'attributes' => {}})
      m = Media.find(params[:id])
      
      save = true      
      params.each do |name, value|
        case name
          when 'name'         then m.name         = value
          when 'description'  then m.description  = value
          when 'sort_order'   then m.sort_order   = value
          when 'image_url'    then
            m.processed = false
            m.delay(:queue => 'caboose_media', :priority => 2).download_image_from_url(value)
        end
      end
      
      m.save
      resp.success = save
      render :json => resp
    end

    # @route POST /admin/media/:id/image
    def admin_update_image
      return unless user_is_allowed('media', 'edit')
      
      resp = StdClass.new
      new_url = params[:new_url]
      m = Media.where(:id => params[:id]).first
      
      if m.nil?
        resp.error = "Invalid media id."              
      elsif new_url.nil? || new_url.strip.length == 0
        resp.error = "Invalid image URL."
      else                
        m.image = URI.parse(new_url)
        m.save
        resp.success = "Image saved successfully."              
      end
      render :json => resp
    end
    
    # @route DELETE /admin/media/:id
    def admin_delete
      return unless user_is_allowed('media', 'delete')
      
      model_ids = params[:id] == 'bulk' ? params[:ids] : [params[:id]]             
      model_ids.each do |media_id|
        ProductImage.where(:media_id => media_id).destroy_all
        Media.where(:id => media_id).destroy_all
      end                  
      render :json => { :success => true }
    end
    
    # @route POST /admin/media/pre-upload
    def admin_pre_upload
      return unless user_is_allowed('media', 'view')
      media_category_id = params[:media_category_id]
      original_name = params[:name]
      name = Caboose::Media.upload_name(original_name)    
      desc = original_name.blank? ? "Media File" : original_name.gsub(/\.[0-9a-z]+$/i,'')
      file_type = params[:file_type]
      if ['image/gif', 'image/jpeg', 'image/png', 'image/tiff'].include? file_type
        image_content_type = file_type
      else
        file_content_type = file_type
      end
      m = Media.where(:media_category_id => media_category_id, :original_name => original_name, :name => name).first
      if m.nil?
        max = Media.where(:media_category_id => media_category_id).maximum(:sort_order)
        m = Media.create(:media_category_id => media_category_id, :description => desc, :sort_order => (max ? (max + 1) : 0), :original_name => original_name, :name => name, :image_content_type => image_content_type, :file_content_type => file_content_type, :processed => false)
      end
      p = Product.where(:media_category_id => media_category_id).last
      if p
        pi = ProductImage.create(:product_id => p.id, :media_id => m.id)
      end
      render :json => { :success => true }
    end
    
  end
end
