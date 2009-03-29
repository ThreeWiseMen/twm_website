class HomeController < ApplicationController

  require 'atom'

  #caches_page :index, :contact, :dev, :hosting, :success

  FEED_URL = "http://svetzal.wordpress.com/category/business/feed/atom/"

  def index
    feed = Atom::Feed.load_feed(URI.parse(FEED_URL))
    item = feed.entries.first
    @title = item.title
    @description = item.summary #methods.sort.join("<br />")
    @link = item.links.first
  end

  def latest
    feed = Atom::Feed.load_feed(URI.parse(FEED_URL))
    item = feed.entries.first
    @title = item.title
    @content = item.content
  end

end
