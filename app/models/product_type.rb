class ProductType < ApplicationRecord
  has_many :product_categories
  has_many :products, through: :product_categories

  attachment :hero_image, content_type: %w(image/jpeg image/png image/gif)
  attachment :icon_image, content_type: %w(image/jpeg image/png image/gif)

  validates :name, presence: true

  default_scope { order('position') }

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
