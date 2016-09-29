class ProductCategory < ApplicationRecord
  belongs_to :product_type
  has_many :products

  validates :name, :product_type, presence: true

  default_scope { order('position') }

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
