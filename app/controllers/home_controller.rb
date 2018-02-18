class HomeController < ApplicationController
  def index
    @safe_articles           = Article.i18n.current.news_articles.join_translations.joins(:tags).where(tags: { name: ['safe', 'safety'] }).order(posted_on: :desc).uniq
    @efficient_articles      = Article.i18n.current.news_articles.join_translations.joins(:tags).where(tags: { name: ['efficient', 'efficiency'] }).order(posted_on: :desc).uniq
    @reliable_articles       = Article.i18n.current.news_articles.join_translations.joins(:tags).where(tags: { name: ['reliable', 'reliability'] }).order(posted_on: :desc).uniq
    @cost_effective_articles = Article.i18n.current.news_articles.join_translations.joins(:tags).where(tags: { name: ['cost effective'] }).order(posted_on: :desc).uniq
    @simple_articles         = Article.i18n.current.news_articles.join_translations.joins(:tags).where(tags: { name: ['simple'] }).order(posted_on: :desc).uniq
    @support_articles        = Article.i18n.current.news_articles.join_translations.joins(:tags).where(tags: { name: ['support'] }).order(posted_on: :desc).uniq
  end

end
