class CaseStudy < Article
  validates :subtitle, :location, :flag, presence: true
end
