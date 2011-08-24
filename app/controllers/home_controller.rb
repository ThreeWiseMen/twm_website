class HomeController < ApplicationController
  require 'uri'

  FEED_URL = "http://feeds2.feedburner.com/threewisemenca"

  def index
    #@blog_item = get_feed.entries.first
    @article = content("home")
    @testimonials = testimonials
    render :layout => "home"
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
    render :layout => "content"
  end

  def consulting
    @intro = content("consulting_intro")
    @performance = content("consulting_performance")
    @integration = content("consulting_integration")
    @communication = content("consulting_communication")
    @development = content("consulting_development")
    @testing = content("consulting_testing")
    @testimonials = testimonials
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
    @testimonials = testimonials
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
    @testimonials = testimonials
    if @title.nil?
      redirect_to "/404.html"
    else
      render :layout => "content"
    end
  end 

  def success
    @testimonials = testimonials
    render :layout => "content"
  end

  def contact
    @testimonials = testimonials
    render :layout => "content"
  end

  def privacy
    @testimonials = testimonials
    render :layout => "content"
  end

  private

  def get_feed
    data = @cache["blog"]
    logger.warn("Data is #{data.inspect}")
    logger.warn("Data #{data.nil?}")
    logger.warn("Class #{data.class.name}")
    logger.warn("Nil #{nil.inspect}")
    if data.compact.empty?
      logger.warn("Priming cache...")
      data = Atom::Feed.load_feed(URI.parse(FEED_URL))
      @cache.set("blog", data, 3600) unless data.nil?
    end
    data.first unless data.nil? && data.class.name == "Array"
  end

end
