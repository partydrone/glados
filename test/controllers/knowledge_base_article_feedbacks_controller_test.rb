require 'test_helper'

describe KnowledgeBaseArticleFeedbacksController do
  let(:knowledge_base_article_feedback) { KnowledgeBaseArticleFeedback.new }

  it "sends an email" do
    -> {
      post knowledge_base_article_feedback_path, params: {
        knowledge_base_article_feedback: {
          feedback: 'This is my feedback'
        }
      }
    }
    # must_redirect_to referer URL
  end
end
