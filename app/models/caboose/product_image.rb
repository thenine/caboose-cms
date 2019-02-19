module Caboose
  class ProductImage < ActiveRecord::Base
    self.table_name = 'store_product_images'
    
    belongs_to :product
    belongs_to :media
    has_many :product_image_variants
    has_many :variants, :through => :product_image_variants
        
    attr_accessible :id,
      :alternate_id,
      :product_id,
      :title,
      :position,
      :image_file_name,
      :image_content_type,
      :image_file_size,
      :image_updated_at,
      :square_offset_x,
      :square_offset_y,
      :square_scale_factor,
      :media_id
      
    has_attached_file :image,      
      :path => ':caboose_prefixproducts/:product_id_:id_:style.:extension',      
      :default_url => 'http://placehold.it/300x300',
      :s3_protocol => :https,
      :styles      => {
        tiny:   '100x100>',
        thumb:  '250x250>',
        medium: '400x400>',
        large:  '800x800>',
        huge:   '1200x1200>'
      }
    do_not_validate_attachment_file_type :image
    #validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
    
    default_scope { order('position ASC') }
            
    def process
      config = AssetSync.config
      bucket = config.fog_directory
      uri = "http://#{bucket}.s3.amazonaws.com/media-images/#{self.id}#{File.extname(self.title.downcase)}"
      self.image = URI.parse(uri)
      self.save
    end
    
    def url(size) # 'tiny', 'thumb', 'medium', 'large', 'huge'
      return self.media.image.url(size) if self.media
      return self.image.url(size)
    end
    
    def urls
      {
        :tiny   => self.url(:tiny),
        :thumb  => self.url(:thumb),
        :medium => self.url(:medium),
        :large  => self.url(:large),
        :huge   => self.url(:huge)
      }      
    end
    
    def as_json(options={})
      self.attributes.merge({
        :urls => {
          :tiny => self.url(:tiny),
          :thumb => self.url(:thumb),
          :medium => self.url(:medium),
          :large => self.url(:large),
          :huge => self.url(:huge)
        }
      })
    end
  end
end
