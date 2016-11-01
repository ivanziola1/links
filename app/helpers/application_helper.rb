module ApplicationHelper
  def format_errors(errors)
    if errors.is_a? Array
      content_tag(:ul, errors.map { |i| content_tag(:li, i) }.reduce(:<<))
    else
      errors
    end
  end

  def link_for(_hyperlink)
    hyperlink = _hyperlink
    hyperlink = "http://#{hyperlink}" if /https?:\/\/[\S]+/.match(hyperlink).nil?
    hyperlink
  end
end
