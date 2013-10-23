module ImageLoadable
  extend ActiveSupport::Concern

  included do
  end

  module ClassMethods
    def loadable_image(image_name)
      define_method "#{image_name}_from_url" do |url, filename_base|
        filename = "#{filename_base.parameterize}#{url[/\.[^.]+$/, 0]}"
        self.send("#{image_name}=", open(url))
        self.send("#{image_name}").instance_write(:file_name, filename)
      end
    end
  end
end
