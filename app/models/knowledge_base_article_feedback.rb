class KnowledgeBaseArticleFeedback
  include ActiveModel::Model
  attr_accessor :message, :article_id

  validates :message, :article_id, presence: true
end
