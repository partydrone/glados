class ProductType < ApplicationRecord
  include ImageUploader[:billboard]
  include ImageUploader[:icon]

  has_many :product_categories
  has_many :products, through: :product_categories

  validates :name, presence: true

  default_scope { order('position') }

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
