module ApplicationHelper

  def sense_page(c, a)
    if c == controller.controller_name and a == controller.action_name
      "active"
    end
  end

  def strip_html string
    string.gsub(/<\/?[^>]*>/, '').gsub("Continue reading &#8594;", '')
  end

end
