require 'test_helper'

class KnowledgeBaseArticlePolicyTest < ActiveSupport::TestCase
  let(:knowledge_base_article) { knowledge_base_articles(:kb_article_one) }
  let(:user) { users(:generic_user) }

  describe "for authorized user" do
    [:admin, :knowledge_base_article_manager].each do |role|
      before do
        user.add_role role
      end

      it "permits index" do
        :knowledge_base_article.must_permit user, :index
      end

      it "permits show" do
        knowledge_base_article.must_permit user, :show
      end

      it "permits new" do
        knowledge_base_article.must_permit user, :new
      end

      it "permits create" do
        knowledge_base_article.must_permit user, :create
      end

      it "permits edit" do
        knowledge_base_article.must_permit user, :edit
      end

      it "permits update" do
        knowledge_base_article.must_permit user, :update
      end

      it "permits destroy" do
        knowledge_base_article.must_permit user, :destroy
      end
    end
  end

  describe "for unauthorized user" do
    it "prohibits index" do
      :knowledge_base_article.wont_permit user, :index
    end

    it "prohibits show" do
      knowledge_base_article.wont_permit user, :show
    end

    it "prohibits new" do
      knowledge_base_article.wont_permit user, :new
    end

    it "prohibits create" do
      knowledge_base_article.wont_permit user, :create
    end

    it "prohibits edit" do
      knowledge_base_article.wont_permit user, :edit
    end

    it "prohibits update" do
      knowledge_base_article.wont_permit user, :update
    end

    it "prohibits destroy" do
      knowledge_base_article.wont_permit user, :destroy
    end
  end

  describe "for guest" do
    it "prohibits index" do
      :knowledge_base_article.wont_permit nil, :index
    end

    it "prohibits show" do
      knowledge_base_article.wont_permit nil, :show
    end

    it "prohibits new" do
      knowledge_base_article.wont_permit nil, :new
    end

    it "prohibits create" do
      knowledge_base_article.wont_permit nil, :create
    end

    it "prohibits edit" do
      knowledge_base_article.wont_permit nil, :edit
    end

    it "prohibits update" do
      knowledge_base_article.wont_permit nil, :update
    end

    it "prohibits destroy" do
      knowledge_base_article.wont_permit nil, :destroy
    end
  end
end
