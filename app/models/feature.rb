class Feature < ApplicationRecord
  acts_as_taggable

  translates :title, :youtube_video_id, :description, :body, fallbacks: { 'fr-FR': :fr }

  has_many :feature_associations, dependent: :destroy
  has_many :products, through: :feature_associations

  attachment :hero_image, content_type: %w(image/jpeg image/png image/gif)

  validates :description, presence: true
  validates :hero_image, presence: true, on: :create, unless: :youtube_video_id_present?

  scope :articles, -> { where.not body: '' }

  def to_param
    "#{id} #{title}".parameterize
  end

  private

  def youtube_video_id_present?
    youtube_video_id.present?
  end
end
