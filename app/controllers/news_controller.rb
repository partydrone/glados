class NewsController < ApplicationController
  def index
    @articles = Article.order(posted_on: :desc)
  end
end
