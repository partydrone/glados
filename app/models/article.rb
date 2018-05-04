class Article < ApplicationRecord
  include PgSearch

  acts_as_taggable_on :tags, :regions

  translates :title, :subtitle, :body, :views, :meta_description, fallbacks: { 'fr-FR': :fr }

  multisearchable :against => [:title, :subtitle, :body]

  has_and_belongs_to_many :products

  attachment :hero_image, content_type: %w(image/jpeg image/png image/gif)

  validates :title, :body, :posted_on, presence: true

  scope :current, -> { where 'posted_on < ?', Date.tomorrow }
  scope :news_articles, -> { where type: ['BlogPost', 'CaseStudy'] }

  # def log_view(by = 1)
  #   self.views ||= 0
  #   self.views += by
  #   self.save(touch: false)
  # end

  def to_param
    "#{id} #{title}".parameterize
  end

  def published?
    posted_on < Date.tomorrow
  end
end
