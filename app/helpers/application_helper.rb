module ApplicationHelper

  def image_url(image, style = nil)
    if image.original_filename
      base_url = ENV['STATICS_BASE_URL'] || ''
      "#{base_url}#{image.url(*[style].compact)}"
    end
  end

  def nav_link(text, link)
    recognized = Rails.application.routes.recognize_path(link)
    if recognized[:controller] == params[:controller] && recognized[:action] == params[:action]
      content_tag(:li, class: 'active') do
        link_to(text, link)
      end
    else
      content_tag(:li) do
        link_to(text, link)
      end
    end
  end
end
