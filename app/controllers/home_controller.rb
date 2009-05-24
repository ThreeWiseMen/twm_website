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
    @article = get_single_content("home")
    render :layout => "layouts/home"
  end

  def development
    @intro = get_single_content("appdev_intro")
    @java = get_single_content("appdev_java")
    @rails = get_single_content("appdev_rails")
    @dotnet = get_single_content("appdev_dotnet")
    @database = get_single_content("appdev_database")
    @expect = get_single_content("appdev_expect")
    @budgeting = get_single_content("appdev_budgeting")
  end

  def consulting
    @intro = get_single_content("consulting_intro")
    @performance = get_single_content("consulting_performance")
    @integration = get_single_content("consulting_integration")
    @communication = get_single_content("consulting_communication")
    @development = get_single_content("consulting_development")
    @testing = get_single_content("consulting_testing")
  end

  def hosting
    @intro = get_single_content("hosting_intro")
    @video = get_single_content("hosting_video")
    @shared1 = get_single_content("hosting_shared1")
    @shared2 = get_single_content("hosting_shared2")
    @shared3 = get_single_content("hosting_shared3")
    @dedicated1 = get_single_content("hosting_dedicated1")
    @dedicated2 = get_single_content("hosting_dedicated2")
    @custom = get_single_content("hosting_custom")
    @pricing = get_single_content("hosting_pricing")
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

  def get_single_content category_name
    queue = @cms.queue category_name, 'historyqueue'
    queue.articles.first
  end

end
