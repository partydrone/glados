class KnowledgeBaseArticle < Article
	include PgSearch
  multisearchable :against => [:title, :body]

  scope :top, -> { current.select(:id, :type, :title).where('updated_at > ?', 3.months.ago).order(views: :desc, updated_at: :desc) }

  def digest
    Digest::SHA1.hexdigest title + body
  end
end
