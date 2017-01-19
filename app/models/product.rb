class Product < ApplicationRecord
  include Taggable

  belongs_to :product_category
  has_and_belongs_to_many :downloads
  has_and_belongs_to_many :patents
  has_many :feature_associations, dependent: :destroy
  has_many :features, through: :feature_associations

  attachment :hero_image, content_type: %w(image/jpeg image/png image/gif)
  attachment :product_image, content_type: %w(image/jpeg image/png image/gif)

  validates :name, :part_number, :summary, :description, :product_category_id, presence: true

  default_scope { order('name ASC') }

  def discontinued?
    expired_on.present? && expired_on < Time.zone.now
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
