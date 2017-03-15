class BlogPost < Article
  validates :author, :subtitle, presence: true
  validates :hero_image, presence: true, on: :create
end
