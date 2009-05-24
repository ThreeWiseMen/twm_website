class HomeController < ApplicationController
  require 'atom'
  require 'uri'
  require 'CMSBinding'

  layout "layouts/content"

  caches_page :contact, :development, :hosting, :success, :consulting, :privacy

  FEED_URL = "http://feeds2.feedburner.com/threewisemenca"

  def initialize
    @cache = MemCache.new("127.0.0.1")
    @cms = CMSBinding::CMSSource.new({:site => 'ATQ-4W', :cache => @cache})
  end

  def index
    @blog_item = get_feed.entries.first
    queue = @cms.queue 'home', 'historyqueue'
    @article = queue.articles.first
    render :layout => "layouts/home"
  end

  def blogentry
    id = "http://svetzal.wordpress.com/?p=#{params[:id]}"
    get_feed.entries.each do |entry|
      if entry.id == id
        @title = entry.title
        @content = entry.content
      end
    end
    redirect_to "/404.html" if @title.nil?
  end 

  private

  def get_feed
    data = @cache["blog"]
    if data.nil?
      data = Atom::Feed.load_feed(URI.parse(FEED_URL))
      @cache.set("blog", data, 3600)
    end
    data
  end

end
