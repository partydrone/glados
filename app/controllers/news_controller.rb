class NewsController < ApplicationController
  def index
    @articles = Article.news_articles.order(posted_on: :desc)
  end
end
