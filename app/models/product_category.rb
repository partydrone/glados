class ProductCategory < ApplicationRecord
  belongs_to :product_type, touch: true
  has_many :products
  has_many :active_products, -> { active }, class_name: 'Product'

  attachment :hero_image, content_type: %w(image/jpeg image/png image/gif)
  attachment :icon_image, content_type: %w(image/jpeg image/png image/gif image/svg+xml)

  validates :name, :product_type, presence: true
  validates :hero_image, :icon_image, presence: true, on: :create

  scope :active, -> {
    joins(:products)
    .where('products.expired_on IS NULL OR products.expired_on > ?', Time.zone.today)
    .where('products.matured_on IS NULL OR products.matured_on > ?', Time.zone.today)
  }
  default_scope { order('product_categories.position') }

  def to_param
    "#{id} #{name}".parameterize
  end
end
