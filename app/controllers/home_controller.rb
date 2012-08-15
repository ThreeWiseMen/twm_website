class HomeController < ApplicationController
  require 'uri'

  FEED_URL = "http://feeds2.feedburner.com/threewisemenca"

  helper_method :testimonials

  def index
    @blog_item = get_feed.entries.first
    @article = content("home")
    render :layout => "home"
  end

  def team
    render :layout => "content"
  end

  def developer
    render :layout => "content"
  end

  def infrastructure
    render :layout => "content"
  end

  def development
    @intro = content("appdev_intro")
    @java = content("appdev_java")
    @rails = content("appdev_rails")
    @dotnet = content("appdev_dotnet")
    @database = content("appdev_database")
    @expect = content("appdev_expect")
    @budgeting = content("appdev_budgeting")
    render :layout => "content"
  end

  def consulting
    @intro = content("consulting_intro")
    @performance = content("consulting_performance")
    @integration = content("consulting_integration")
    @communication = content("consulting_communication")
    @development = content("consulting_development")
    @testing = content("consulting_testing")
    render :layout => "content"
  end

  def hosting
    @intro = content("hosting_intro")
    @video = content("hosting_video")
    @shared1 = content("hosting_shared1")
    @shared2 = content("hosting_shared2")
    @shared3 = content("hosting_shared3")
    @dedicated1 = content("hosting_dedicated1")
    @dedicated2 = content("hosting_dedicated2")
    @custom = content("hosting_custom")
    @pricing = content("hosting_pricing")
    render :layout => "content"
  end

  def blogentry
    id = "http://svetzal.wordpress.com/?p=#{params[:id]}"
    get_feed.entries.each do |entry|
      if entry.id == id
        @title = entry.title
        @content = entry.content
      end
    end
    if @title.nil?
      redirect_to "/404.html"
    else
      render :layout => "content"
    end
  end 

  def success
    render :layout => "content"
  end

  def contact
    render :layout => "content"
  end

  def privacy
    render :layout => "content"
  end

  private

  def get_feed
    data = @cache["blog"]
    if data.compact.empty? || data.nil?
      logger.warn("Priming cache...")
      data = Atom::Feed.load_feed(URI.parse(FEED_URL))
      @cache.set("blog", data, 3600) unless data.nil?
    end
    data
  end

end
