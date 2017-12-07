class ProductCategory < ApplicationRecord
  translates :name, :description

  belongs_to :product_type, touch: true
  has_many :products

  attachment :hero_image, content_type: %w(image/jpeg image/png image/gif)
  attachment :icon_image, content_type: %w(image/jpeg image/png image/gif image/svg+xml)

  validates :name, :product_type, presence: true
  validates :hero_image, :icon_image, presence: true, on: :create

  default_scope { order('product_categories.position') }

  def self.active
    joins(:products)
    .where('products.expired_on IS NULL OR products.expired_on > ?', Time.zone.today)
    .where('products.matured_on IS NULL OR products.matured_on > ?', Time.zone.today)
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
