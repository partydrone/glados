require 'test_helper'

describe KnowledgeBaseArticleFeedback do
  let(:knowledge_base_article_feedback) { KnowledgeBaseArticleFeedback.new(message: 'Feedback message.', article_id: '1') }

  it "is a valid object" do
    knowledge_base_article_feedback.must_be :valid?
  end

  it "requires feedback" do
    knowledge_base_article_feedback.message = ' '
    knowledge_base_article_feedback.wont_be :valid?
  end

  it "requires a knowledge base article" do
    knowledge_base_article_feedback.article_id = ' '
    knowledge_base_article_feedback.wont_be :valid?
  end
end
