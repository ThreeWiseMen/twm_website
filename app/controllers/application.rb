# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'fd7fd49b8caba304e65ea9e21f54491c'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password

  def initialize
    @cache = MemCache.new("127.0.0.1")
    @cms = CMSBinding::CMSSource.new({:site => 'ATQ-4W', :port => '8001', :cache => @cache, :cache_timeout => 3600})
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
