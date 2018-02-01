class NewsController < ApplicationController
  def index
    @articles = Article.with_translations(current_locale_with_fallback).news_articles.order(posted_on: :desc)
  end
end
