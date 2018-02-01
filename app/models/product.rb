class Product < ApplicationRecord
  include Taggable
  include PgSearch

  translates :summary, :description, :youtube_video_id

  multisearchable :against => [:name, :summary, :description]

  belongs_to :product_category, touch: true
  has_many :feature_associations, dependent: :destroy
  has_many :features, through: :feature_associations
  has_many :training_course_products, dependent: :destroy
  has_many :training_courses, through: :training_course_products
  has_and_belongs_to_many :articles
  has_and_belongs_to_many :downloads
  has_and_belongs_to_many :patents
  has_and_belongs_to_many :software_downloads

  default_scope { order(name: :asc) }

  scope :discontinued, -> { where('expired_on <= ?', Time.zone.today) }
  scope :knowledge_base_articles, -> {
    includes(:articles)
    .where(articles: {type: 'KnowledgeBaseArticle'})
  }

  attachment :hero_image, content_type: %w(image/jpeg image/png image/gif)
  attachment :product_image, content_type: %w(image/jpeg image/png image/gif)

  validates :name, :part_number, :summary, :description, :product_category_id, presence: true
  validates :hero_image, :product_image, presence: true, on: :create, unless: :youtube_video_id_present?
  validate  :matures_before_expires

  before_save do
    self.country_ids.reject! { |item| item.blank? }
  end

  def self.active
    where('expired_on IS NULL OR expired_on > ?', Time.zone.today)
    .where('matured_on IS NULL OR matured_on > ?', Time.zone.today)
  end

  def self.available(locale = I18n.locale)
    locale =~ /^([a-z]{2,2})(?:[-|_]([A-Z]{2,2}))?$/i
    query = where("'#{$2}' = ANY (country_ids)")

    if query.exists?
      query
    else
      all
    end
  end

  def self.knowledge_base_article_search(query = nil)
    if query.present?
      joins(product_category: :product_type)
      .knowledge_base_articles
      .where('articles.title @@ :q or articles.subtitle @@ :q or articles.body @@ :q', q: query)
      .references(:articles)
      .reorder('product_types.position, products.name')
    else
      joins(product_category: :product_type)
      .knowledge_base_articles
      .reorder('product_types.position, products.name')
    end
  end

  def discontinued?
    expired_on.present? && expired_on <= Time.zone.now
  end

  def matured?
    matured_on.present? && matured_on <= Time.zone.now && !discontinued?
  end

  def to_param
    "#{id} #{name}".parameterize
  end

  private

  def matures_before_expires
    if (expired_on && matured_on) && expired_on < matured_on
      errors.add :expired_on, %(can't be earlier than matured on)
    end
  end

  def youtube_video_id_present?
    youtube_video_id.present?
  end
end
