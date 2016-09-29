class Product < ApplicationRecord
  belongs_to :product_category
  # has_and_belongs_to_many :downloads
  has_and_belongs_to_many :patents

  validates :name, :part_number, :product_category_id, presence: true

  default_scope { order('name ASC') }

  def discontinued?
    expired_on.present? && expired_on < Time.zone.now
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
