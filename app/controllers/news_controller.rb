class NewsController < ApplicationController
  def index
    @articles = Article.i18n.join_translations.news_articles.order(posted_on: :desc)
  end
end
