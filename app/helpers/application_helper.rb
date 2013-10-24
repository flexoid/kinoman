module ApplicationHelper

  def image_url(image, style = nil)
    if image.original_filename
      base_url = ENV['STATICS_BASE_URL'] || ''
      "#{base_url}#{image.url(*[style].compact)}"
    end
  end
end
