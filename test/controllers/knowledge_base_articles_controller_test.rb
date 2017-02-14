require 'test_helper'

describe KnowledgeBaseArticlesController, :locale do
  let(:knowledge_base_article) { knowledge_base_articles(:kb_article_one) }

  it "should get index" do
    get knowledge_base_articles_path
    must_respond_with :success
  end

  it "should get show" do
    get knowledge_base_article_path(knowledge_base_article)
    must_respond_with :success
  end
end
