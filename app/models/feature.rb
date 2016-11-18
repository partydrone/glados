class Feature < ApplicationRecord
  include ImageUploader[:billboard]

  has_many :feature_associations, dependent: :destroy
  has_many :products, through: :feature_associations

  validates :description, presence: true

  def to_param
    "#{id}-#{title.parameterize}"
  end
end
