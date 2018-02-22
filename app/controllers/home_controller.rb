class HomeController < ApplicationController
  def index
    @safe_articles           = Article.i18n.current.news_articles.join_translations.tagged_with(['safe', 'safety'], any: true).order(posted_on: :desc)
    @efficient_articles      = Article.i18n.current.news_articles.join_translations.tagged_with(['efficient', 'efficiency'], any: true).order(posted_on: :desc)
    @reliable_articles       = Article.i18n.current.news_articles.join_translations.tagged_with(['reliable', 'reliability'], any: true).order(posted_on: :desc)
    @cost_effective_articles = Article.i18n.current.news_articles.join_translations.tagged_with(['cost effective'], any: true).order(posted_on: :desc)
    @simple_articles         = Article.i18n.current.news_articles.join_translations.tagged_with(['simple'], any: true).order(posted_on: :desc)
    @support_articles        = Article.i18n.current.news_articles.join_translations.tagged_with(['support'], any: true).order(posted_on: :desc)
  end
end
