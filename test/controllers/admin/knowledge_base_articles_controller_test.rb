require 'test_helper'

describe Admin::KnowledgeBaseArticlesController, :locale do
  let(:knowledge_base_article) { knowledge_base_articles(:kb_article_one) }

  describe "with authenticated user" do
    let(:user) { users(:generic_user) }

    before do
      sign_in user
    end

    it "gets index" do
      get admin_knowledge_base_articles_path
      must_respond_with :success
    end

    it "gets new" do
      get new_admin_knowledge_base_article_path
      must_respond_with :success
    end

    it "creates a knowledge base article" do
      -> {
        post admin_knowledge_base_articles_path, params: {
          knowledge_base_article: {
            title: 'System One',
            subtitle: 'Get ready for the next generation of traffic detection solutions.',
            body: 'System one has been five years in the making, and it is totally worth the wait!',
            posted_on: Date.today.to_s(:db)
          }
        }
      }.must_change 'KnowledgeBaseArticle.count'
      flash[:notice].wont_be_nil
      must_redirect_to admin_knowledge_base_article_path(KnowledgeBaseArticle.last)
    end

    it "gets show" do
      get admin_knowledge_base_article_path(knowledge_base_article)
      must_respond_with :success
    end

    it "gets edit" do
      get edit_admin_knowledge_base_article_path(knowledge_base_article)
      must_respond_with :success
    end

    it "updates a knowledge base article" do
      patch admin_knowledge_base_article_path(knowledge_base_article), params: {
        knowledge_base_article: {
          title: knowledge_base_article.title
        }
      }
      must_redirect_to admin_knowledge_base_article_path(knowledge_base_article)
    end

    it "destroys a knowledge base article" do
      -> {
        delete admin_knowledge_base_article_path(knowledge_base_article)
      }.must_change 'KnowledgeBaseArticle.count', -1
      must_redirect_to admin_knowledge_base_articles_path
    end
  end

  describe "without authenticated user" do
    it "prohibits index" do
      get admin_knowledge_base_articles_path
      must_redirect_to sign_in_path
    end

    it "prohibits new" do
      get new_admin_knowledge_base_article_path
      must_redirect_to sign_in_path
    end

    it "won't create a knowledge base article" do
      -> {
        post admin_knowledge_base_articles_path, params: {
          knowledge_base_article: {
            title: 'System One',
            subtitle: 'Get ready for the next generation of traffic detection solutions.',
            body: 'System one has been five years in the making, and it is totally worth the wait!',
            posted_on: Date.today.to_s(:db)
          }
        }
      }.wont_change 'KnowledgeBaseArticle.count'
      must_redirect_to sign_in_path
    end

    it "prohibits show" do
      get admin_knowledge_base_article_path(knowledge_base_article)
      must_redirect_to sign_in_path
    end

    it "prohibits edit" do
      get edit_admin_knowledge_base_article_path(knowledge_base_article)
      must_redirect_to sign_in_path
    end

    it "won't update a knowledge base article" do
      patch admin_knowledge_base_article_path(knowledge_base_article), params: {
        knowledge_base_article: {
          title: knowledge_base_article.title
        }
      }
      must_redirect_to sign_in_path
    end

    it "won't destroy a knowledge base article" do
      -> {
        delete admin_knowledge_base_article_path(knowledge_base_article)
      }.wont_change 'KnowledgeBaseArticle.count', -1
      must_redirect_to sign_in_path
    end
  end
end
