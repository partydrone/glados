class BlogPost < Article
  validates :author, :subtitle, presence: true
  validates :hero_image, presence: true, on: :create
  include PgSearch
    multisearchable :against => [:title, :subtitle, :body]
end
