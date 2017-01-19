require 'test_helper'

describe Article do
  let(:article) { Article.new(title: 'Article Title', body: 'Article body text.', posted_on: Date.today.to_s(:db)) }

  it "is a valid object" do
    article.must_be :valid?
  end

  it "requires a title" do
    article.title = ' '
    article.wont_be :valid?
  end

  it "requires body text" do
    article.body = ' '
    article.wont_be :valid?
  end

  it "requires a posted date" do
    article.posted_on = ' '
    article.wont_be :valid?
  end

  it "returns a list of current articles" do
    past_article = Article.create(title: "Past Article", body: "Past article body", posted_on: 5.days.ago)
    future_article = Article.create(title: "Future Article", body: "Future article body", posted_on: 5.days.from_now)

    articles = Article.current

    articles.must_include past_article
    articles.wont_include future_article
  end

  it "has tags" do
    article.must_respond_to :tags
  end
end
