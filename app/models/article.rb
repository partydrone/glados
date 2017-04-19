class Article < ApplicationRecord
  include Taggable
  include PgSearch
    multisearchable :against => [:title, :subtitle, :body]

  has_and_belongs_to_many :products

  attachment :hero_image, content_type: %w(image/jpeg image/png image/gif)

  validates :title, :subtitle, :body, :posted_on, presence: true

  scope :current, -> { where 'posted_on < ?', Date.tomorrow }
  scope :news_articles, -> { where type: ['BlogPost', 'CaseStudy'] }

  def log_view(by = 1)
    self.views ||= 0
    self.views += by
    self.save
  end

  def to_param
    "#{id}-#{title.parameterize}"
  end
end
