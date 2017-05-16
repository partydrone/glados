require 'test_helper'

describe Article do
  let(:article) { Article.new(title: 'Article Title', subtitle: 'Article subtitle text.', body: 'Article body text.', posted_on: Date.today.to_s(:db), hero_image_id: 1) }

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
    past_article = articles(:past_article)
    future_article = articles(:future_article)

    articles = Article.current

    articles.must_include past_article
    articles.wont_include future_article
  end

  it "has tags" do
    article.must_respond_to :tags
  end

  it "has associated products" do
    article.must_respond_to :products
  end

  it "has views" do
    article.must_respond_to :views
  end

  it "logs views" do
    article.views = 0
    article.save
    article.log_view
    article.reload
    article.views.must_equal 1
  end

  it "filters news articles" do
    blog_post  = blog_posts(:new_blog_post)
    case_study = case_studies(:new_case_study)
    kb_article = knowledge_base_articles(:kb_article_one)

    Article.news_articles.must_include blog_post
    Article.news_articles.must_include case_study
    Article.news_articles.wont_include kb_article
  end

  it "checks if article is published" do
    article.posted_on = 2.days.ago
    article.published?.must_equal true
  end

  it "checks if article is not published" do
    article.posted_on = 2.days.from_now
    article.published?.must_equal false
  end

  it "has a tag list" do
    article.must_respond_to :tag_list
  end

  it "accepts a list of tags" do
    article.tag_list = 'one, two, three'
    article.tags.must_include Tag.find_by(name: 'one')
    article.tags.must_include Tag.find_by(name: 'two')
    article.tags.must_include Tag.find_by(name: 'three')
  end

  it "saves a new article created with tags" do
    article.tag_list = 'do, re, me'
    article.save.must_equal true
  end

  it "updates an article with tags" do
    article.save.must_equal true
    article.tag_list = 'hop, skip, jump'
    article.reload
    article.tag_list.must_equal 'hop, jump, skip'
  end
end
