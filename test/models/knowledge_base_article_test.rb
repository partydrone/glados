require 'test_helper'

describe KnowledgeBaseArticle do
  let(:knowledge_base_article) { KnowledgeBaseArticle.new(title: 'Test Knowledge Base Article', subtitle: 'Test knowledge base article subtitle.', body: 'Test knowledge article body.', posted_on: Date.today.to_s(:db)) }

  it "is a valid object" do
    knowledge_base_article.must_be :valid?
  end

  it "creates a digest hash" do
    knowledge_base_article.digest.must_equal Digest::SHA1.hexdigest(knowledge_base_article.title + knowledge_base_article.subtitle + knowledge_base_article.body)
  end
end
