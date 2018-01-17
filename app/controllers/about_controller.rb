class AboutController < ApplicationController
  def index
    @recent_articles  = Article.current.news_articles.order(posted_on: :desc).limit(4).to_a
    @featured_article = @recent_articles.shift

    @top_articles = Article.current.news_articles.order(views: :desc, updated_at: :desc).limit(10)
    @top_tags     = Tag.without_regions.where('taggings_count > 0').reorder(taggings_count: :desc, name: :asc).limit(10)
    @top_regions  = Tag.regions.where('taggings_count > 0').reorder(taggings_count: :desc, name: :asc).limit(10)
  end

  def careers

  end
end
