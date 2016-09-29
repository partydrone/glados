require 'test_helper'

describe Article do
  let(:article) { Article.new(title: 'Article Title', body: 'Article body text.') }

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
end
