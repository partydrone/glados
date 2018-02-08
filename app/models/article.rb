class Article < ApplicationRecord
  include Taggable
  include PgSearch

  translates :title, type: :string
  translates :subtitle, type: :text
  translates :body, type: :text
  translates :views, type: :integer

  multisearchable :against => [:title, :subtitle, :body]

  has_and_belongs_to_many :products

  attachment :hero_image, content_type: %w(image/jpeg image/png image/gif)

  validates :title, :body, :posted_on, presence: true

  scope :current, -> { where 'posted_on < ?', Date.tomorrow }
  scope :news_articles, -> { where type: ['BlogPost', 'CaseStudy'] }

  def log_view(by = 1)
    self.views ||= 0
    self.views += by
    self.save
  end

  def to_param
    "#{id} #{title}".parameterize
  end

  def published?
    posted_on < Date.tomorrow
  end
end
