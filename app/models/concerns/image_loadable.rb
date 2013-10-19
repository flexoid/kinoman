module ImageLoadable
  extend ActiveSupport::Concern

  included do
  end

  module ClassMethods
    def loadable_image(image_name)
      define_method "#{image_name}_from_url" do |url|
        self.send("#{image_name}=", open(url))
      end
    end
  end
end
