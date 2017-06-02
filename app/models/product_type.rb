class ProductType < ApplicationRecord
  has_many :product_categories
  has_many :products, through: :product_categories
  has_many :active_product_categories, -> { active }, class_name: ProductCategory

  attachment :hero_image, content_type: %w(image/jpeg image/png image/gif)
  attachment :icon_image, content_type: %w(image/jpeg image/png image/gif image/svg+xml)

  validates :name, presence: true
  validates :hero_image, :icon_image, presence: true, on: :create

  default_scope { order('product_types.position') }

  def to_param
    "#{id} #{name}".parameterize
  end
end
