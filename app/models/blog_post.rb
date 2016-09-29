class BlogPost < Article
  validates :author, presence: true
end
