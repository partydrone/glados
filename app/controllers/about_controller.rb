class AboutController < ApplicationController
  def index
    @recent_articles  = Article.current.order(posted_on: :desc).limit(4).to_a
    @featured_article = @recent_articles.shift

    @top_articles = Article.current.select(:id, :type, :title).order(views: :desc).limit(10)
    @top_tags     = nil
    @top_regions  = nil
  end

  def news_events
  end
end
