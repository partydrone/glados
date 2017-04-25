class ProductCategory < ApplicationRecord
  belongs_to :product_type
  has_many :products
  has_many :active_products, -> { active }, class_name: 'Product'

  attachment :hero_image, content_type: %w(image/jpeg image/png image/gif)
  attachment :icon_image, content_type: %w(image/jpeg image/png image/gif image/svg+xml)

  validates :name, :product_type, presence: true
  validates :hero_image, :icon_image, presence: true, on: :create

  default_scope { order('position') }

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
