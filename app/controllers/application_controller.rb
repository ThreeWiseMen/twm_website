class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all
  include ExceptionNotifiable

  def initialize
    @cache = MemCache.new("127.0.0.1")
    @cms = CMSBinding::CMSSource.new({:site => 'ATQ-4W', :server => 'cms.hostingoperationscentre.com', :port => '8000', :cache => @cache, :cache_timeout => 3600})
  end

  def content category_name
    queue = @cms.queue category_name, "historyqueue"
    queue.articles.first
  end

  def testimonials
    queue = @cms.queue "testimonials", "historyqueue"
    queue.articles
  end

end
