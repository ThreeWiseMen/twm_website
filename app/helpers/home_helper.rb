module HomeHelper

  def blog_strip_id url
    url.scan(/p=(\d+)$/).first
  end

  def dev_tab_index name
    case name
      when "java"
        0
      when "rails"
        1
    end
  end

end
