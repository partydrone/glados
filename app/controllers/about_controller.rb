class AboutController < ApplicationController
  def index
    @recent_articles  = Article.i18n.current.news_articles.order(posted_on: :desc).limit(4).to_a
    @featured_article = @recent_articles.shift

    @top_articles = Article.i18n.current.news_articles.join_translations.order('article_translations.views desc', 'articles.posted_on desc').limit(10)
    @top_tags     = ActsAsTaggableOn::Tag.for_context(:tags).most_used(10)
    @top_regions  = ActsAsTaggableOn::Tag.for_context(:regions).most_used(10)
  end

  def careers

  end
end
