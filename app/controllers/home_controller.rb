class HomeController < ApplicationController
 # require 'rubygems'
  require 'atom'
  require 'uri'
#  require 'hpricot'

  caches_page :contact, :dev, :hosting, :success, :consulting, :privacy

  FEED_URL = "http://svetzal.wordpress.com/category/business/feed/atom/"

  def index
    @blog_item = get_feed.entries.first
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
