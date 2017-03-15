class KnowledgeBaseArticle < Article
  scope :top, -> { current.select(:id, :type, :title).where('updated_at > ?', 3.months.ago).order(views: :desc) }
end
