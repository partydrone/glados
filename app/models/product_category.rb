class ProductCategory < ApplicationRecord
  belongs_to :product_type
  has_many :products

  attachment :hero_image, content_type: %w(image/jpeg image/png image/gif)
  attachment :icon_image, content_type: %w(image/jpeg image/png image/gif)

  validates :name, :product_type, presence: true
  validates :hero_image, :icon_image, presence: true, on: :create

  default_scope { order('position') }

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
