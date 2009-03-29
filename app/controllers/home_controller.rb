class HomeController < ApplicationController

  require 'atom'
  require 'uri'

  #caches_page :index, :contact, :dev, :hosting, :success

  FEED_URL = "http://svetzal.wordpress.com/category/business/feed/atom/"

  def index
    @blog_item = get_feed.entries.first
  end

  def latest
    item = get_feed.entries.first
    @title = "#{item.title} (#{item.id})"
    @content = item.methods.sort.join("<br />") #item.content
  end

  def blogentry
    get_feed.entries.each do |entry|
      if entry.id == URI.unescape(params[:url])
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
