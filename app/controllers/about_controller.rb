class AboutController < ApplicationController
  def index
    @articles = Article.order(posted_on: :desc).limit(4).to_a
    @featured_article = @articles.shift
  end

  def news_events
  end
end
