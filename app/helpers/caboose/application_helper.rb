module Caboose
  module ApplicationHelper
    def caboose_tinymce
      return "
<script src='https://cdnjs.cloudflare.com/ajax/libs/tinymce/4.7.13/tinymce.min.js'></script>
<script type='text/javascript'>
//<![CDATA[
tinyMCE.init({
  selector: 'textarea.tinymce',
  width: '800px',
  height: '300px',
  convert_urls: false,
  plugins: 'advlist autolink lists link image charmap preview hr anchor pagebreak searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking table contextmenu directionality paste textcolor caboose',
  toolbar1: 'caboose_save caboose_cancel | bold italic forecolor backcolor | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
  image_advtab: true,
  external_plugins: { 'caboose': '#{Caboose::cdn_domain == '/' ? '' : "//#{Caboose::cdn_domain}"}/assets/tinymce/plugins/caboose/plugin.js' },
  setup: function(editor) {
    var control = ModelBinder.tinymce_control(editor.id);     
    editor.on('keyup', function(e) { control.tinymce_change(editor); });
  }
});
//]]>
</script>\n"
    end
    
    def parent_categories
      Caboose::Category.find(1).children.where(:status => 'Active')
    end

    def forem_user
      return @logged_in_user
    end
          
    def gzip_javascript_include_tag(asset)
      tag = javascript_include_tag asset    
      tag = tag.gsub(/\.js/i, ".js.gz") if Rails.env.production? && request.accept_encoding =~ /gzip/i
      #tag = tag.gsub(/\.js/i, ".js.gz") if request.accept_encoding =~ /gzip/i
      tag.html_safe
    end
    
    def gzip_stylesheet_link_tag(asset)      
      tag = stylesheet_link_tag asset, media: "all"     
      tag = tag.gsub(/\.css/i, ".css.gz") if Rails.env.production? && request.accept_encoding =~ /gzip/i
      #tag = tag.gsub(/\.css/i, ".css.gz") if request.accept_encoding =~ /gzip/i
      tag.html_safe
    end
    
    def cloudfront_asset_path(path)
      str = asset_path(str)      
      str = str.gsub('http://', 'https://') if request.env['HTTPS'] == 'on'
      return str
    end

    def caboose_asset_path(path, options = {})
      str = ""
      begin
        str = asset_path(path, options)
      rescue Sprockets::Helpers::RailsHelper::AssetPaths::AssetNotPrecompiledError
        Caboose.log("Precompiled asset not found\n\nAsset: #{path}\nFile: #{caller_locations[1].path}\nLine: #{caller_locations[1].lineno}")
      end
      return str
    end

  end
end
