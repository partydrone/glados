class BlogPost < Article
  validates :author, presence: true
  validates :hero_image, presence: true, on: :create
end
