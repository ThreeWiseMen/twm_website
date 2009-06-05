class HomeController < ApplicationController
  require 'atom'
  require 'uri'
  require 'CMSBinding'

  layout "layouts/content"

  caches_page :index, :contact, :development, :hosting, :success, :consulting, :privacy

  FEED_URL = "http://feeds2.feedburner.com/threewisemenca"

  def index
    @blog_item = get_feed.entries.first
    @article = content("home")
    @testimonials = testimonials
    render :layout => "layouts/home"
  end

  def development
    @intro = content("appdev_intro")
    @java = content("appdev_java")
    @rails = content("appdev_rails")
    @dotnet = content("appdev_dotnet")
    @database = content("appdev_database")
    @expect = content("appdev_expect")
    @budgeting = content("appdev_budgeting")
    @testimonials = testimonials
  end

  def consulting
    @intro = content("consulting_intro")
    @performance = content("consulting_performance")
    @integration = content("consulting_integration")
    @communication = content("consulting_communication")
    @development = content("consulting_development")
    @testing = content("consulting_testing")
    @testimonials = testimonials
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
    @testimonials = testimonials
  end

  def blogentry
    id = "http://svetzal.wordpress.com/?p=#{params[:id]}"
    get_feed.entries.each do |entry|
      if entry.id == id
        @title = entry.title
        @content = entry.content
      end
    end
    @testimonials = testimonials
    redirect_to "/404.html" if @title.nil?
  end 

  def success
    @testimonials = testimonials
  end

  def contact
    @testimonials = testimonials
  end

  def privacy
    @testimonials = testimonials
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
