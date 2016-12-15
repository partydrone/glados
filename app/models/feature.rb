class Feature < ApplicationRecord
  has_many :feature_associations, dependent: :destroy
  has_many :products, through: :feature_associations

  attachment :hero_image, content_type: %w(image/jpeg image/png image/gif)

  validates :description, presence: true

  def to_param
    "#{id}-#{title.parameterize}"
  end
end
