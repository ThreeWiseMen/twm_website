module HomeHelper

  def blog_strip_id url
    url.scan(/p=(\d+)$/).first
  end

end
