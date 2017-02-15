class CaseStudy < Article
  validates :subtitle, :location, :flag, presence: true
  validates :hero_image, presence: true, on: :create
end
