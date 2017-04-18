class Product < ApplicationRecord
  include Taggable
  include PgSearch
    multisearchable :against => [:name, :summary, :description]

  belongs_to :product_category
  has_many :feature_associations, dependent: :destroy
  has_many :features, through: :feature_associations
  has_many :training_course_products, dependent: :destroy
  has_many :training_courses, through: :training_course_products
  has_and_belongs_to_many :articles
  has_and_belongs_to_many :downloads
  has_and_belongs_to_many :patents

  default_scope { order(name: :asc) }

  scope :knowledge_base_articles, -> { includes(:articles).where(articles: {type: 'KnowledgeBaseArticle'}) }

  attachment :hero_image, content_type: %w(image/jpeg image/png image/gif)
  attachment :product_image, content_type: %w(image/jpeg image/png image/gif)

  validates :name, :part_number, :summary, :description, :product_category_id, presence: true
  validates :hero_image, :product_image, presence: true, on: :create, unless: :youtube_video_id_present?

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
    expired_on.present? && expired_on < Time.zone.now
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end

  private

  def youtube_video_id_present?
    youtube_video_id.present?
  end
end
