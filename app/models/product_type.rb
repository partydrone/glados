class ProductType < ApplicationRecord
  translates :name

  has_many :product_categories
  has_many :products, through: :product_categories

  attachment :hero_image, content_type: %w(image/jpeg image/png image/gif)
  attachment :icon_image, content_type: %w(image/jpeg image/png image/gif image/svg+xml)

  validates :name, presence: true
  validates :hero_image, :icon_image, presence: true, on: :create

  default_scope { order('product_types.position') }

  def self.active
    joins(:products)
    .where('products.expired_on IS NULL OR products.expired_on > ?', Time.zone.now)
    .where('products.matured_on IS NULL OR products.matured_on > ?', Time.zone.now)
    .distinct
  end

  def self.available(locale = I18n.locale)
    locale =~ /^([a-z]{2,2})(?:[-|_]([A-Z]{2,2}))?$/i
    query = joins(:products)
            .where("'#{$2}' = ANY (products.country_ids)")
            .distinct

    if query.exists?
      query
    else
      all
    end
  end

  def to_param
    "#{id} #{name}".parameterize
  end
end
