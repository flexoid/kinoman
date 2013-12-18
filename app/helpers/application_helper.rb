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

  def render_breadcrumbs(breadcrumbs)
    if breadcrumbs.present?
      content_tag 'ol', class: 'breadcrumb' do
        ''.tap do |content|
          breadcrumbs[0...-1].each do |breadcrumb|
            content << content_tag('li', content_tag('a', breadcrumb[0], href: breadcrumb[1]))
          end
          content << content_tag('li', breadcrumbs[-1][0])
        end.html_safe
      end
    end
  end
end
