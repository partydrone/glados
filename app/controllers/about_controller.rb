class AboutController < ApplicationController
  def index
    @recent_articles  = Article.i18n.current.news_articles.order(posted_on: :desc).limit(4).to_a
    @featured_article = @recent_articles.shift

    @top_articles = Article.i18n.current.news_articles.join_translations.order('article_translations.views desc', 'articles.posted_on desc').limit(10)
    @top_tags     = Tag.without_regions.where('taggings_count > 0').reorder(taggings_count: :desc, name: :asc).limit(10)
    @top_regions  = Tag.regions.where('taggings_count > 0').reorder(taggings_count: :desc, name: :asc).limit(10)
  end

  def careers

  end
end
