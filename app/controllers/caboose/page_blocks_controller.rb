
module Caboose
  class PageBlocksController < ApplicationController
    
    #===========================================================================
    # Admin actions
    #===========================================================================
    
    # GET /admin/pages/:page_id/blocks
    def admin_index
      return if !user_is_allowed('pages', 'view')
      blocks = PageBlock.where(:page_id => params[:page_id]).reorder(:sort_order)
      render :json => blocks      
    end

    # GET /admin/pages/:page_id/blocks/new
    def admin_new
      return unless user_is_allowed('pages', 'add')
      @page = Page.find(params[:page_id])
      @block = PageBlock.new(:page_id => params[:page_id])
      render :layout => 'caboose/admin'
    end
    
    # GET /admin/pages/:page_id/blocks/:id
    def admin_show
      return unless user_is_allowed('pages', 'edit')      
      block = PageBlock.find(params[:id])
      render :json => block
    end
    
    # GET /admin/pages/:page_id/blocks/:id/render
    def admin_render
      return unless user_is_allowed('pages', 'edit')      
      block = PageBlock.find(params[:id])             
      render :text => block.render(params[:empty_text])
    end
    
    # GET /admin/pages/:page_id/blocks/render
    def admin_render_all
      return unless user_is_allowed('pages', 'edit')
      p = Page.find(params[:page_id])
      blocks = p.blocks.collect { |b| {
        :id => b.id,
        :block_type => b.block_type,
        :sort_order => b.sort_order,          
        :name => b.name,
        :value => b.value,
        :html => b.render(params[:empty_text])
      }}      
      render :json => blocks
    end
    
    # GET /admin/pages/:page_id/blocks/:id/edit
    def admin_edit
      return unless user_is_allowed('pages', 'edit')
      @page = Page.find(params[:page_id])
      @block = PageBlock.find(params[:id])
      render "caboose/page_blocks/admin_edit_#{@block.block_type}", :layout => 'caboose/modal'
    end
    
    # POST /admin/pages/:page_id/blocks
    def admin_create
      return unless user_is_allowed('pages', 'add')

      resp = Caboose::StdClass.new({
          'error' => nil,
          'redirect' => nil
      })

      b = PageBlock.new            
      b.page_id     = params[:page_id].to_i
      b.block_type  = params[:block_type]
      b.name        = params[:name]  if params[:name]
      b.value       = params[:value] if params[:value]      
                    
      if !params[:index].nil?      
        b.sort_order = params[:index].to_i
      elsif params[:after_id]
        b2 = PageBlock.find(params[:after_id].to_i)
        b.sort_order = b2.sort_order + 1        
      end
      
      i = b.sort_order + 1
      PageBlock.where("page_id = ? and sort_order >= ?", b.page_id, b.sort_order).reorder(:sort_order).each do |b2|
        b2.sort_order = i
        b2.save        
        i = i + 1
      end      
      
      # Save the block
      b.save

      # Send back the response
      resp.block = b
      render :json => resp
    end
    
    # PUT /admin/pages/:page_id/blocks/:id
    def admin_update
      return unless user_is_allowed('pages', 'edit')
      
      resp = StdClass.new({'attributes' => {}})
      b = PageBlock.find(params[:id])
      
      save = true
      user = logged_in_user
      params.each do |name, value|
        case name          
        when 'block_type'
          b.block_type = value
        when 'sort_order'          
          b.sort_order = value.to_i
          i = b.sort_order + 1
          PageBlock.where("page_id = ? and sort_order >= ?", b.page_id, b.sort_order).reorder(:sort_order).each do |b2|
            b2.sort_order = i
            b2.save
            i = i + 1          
          end        
        when 'name'
          b.name = value          
        when 'value'    
          b.value = value      
        end
      end
    
      resp.success = save && b.save
      render :json => resp
    end
    
    # DELETE /admin/pages/:page_id/blocks/:id
    def admin_delete
      return unless user_is_allowed('pages', 'delete')
      PageBlock.find(params[:id]).destroy            
      resp = StdClass.new({
        'redirect' => "/admin/pages/#{params[:page_id]}/edit"
      })
      render :json => resp
    end
		
  end
end