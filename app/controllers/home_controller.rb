class HomeController < ApplicationController
  require 'atom'
  require 'uri'
  require 'CMSBinding'
 # require 'hpricot'

  layout "layouts/content"

  caches_page :contact, :development, :hosting, :success, :consulting, :privacy

  FEED_URL = "http://feeds2.feedburner.com/threewisemenca"

  def initialize
    @cms = CMSBinding::CMSSource.new({:site => 'ATQ-4W'})
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
    Atom::Feed.load_feed(URI.parse(FEED_URL))
  end

end
