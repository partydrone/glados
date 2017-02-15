require 'test_helper'

describe KnowledgeBaseArticle do
  let(:knowledge_base_article) { KnowledgeBaseArticle.new(title: 'Test Knowledge Base Article', body: 'Test knowledge article body.', posted_on: Date.today.to_s(:db)) }

  it "is a valid object" do
    knowledge_base_article.must_be :valid?
  end
end
