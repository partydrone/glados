class Tag < ApplicationRecord
  REGIONS = ['africa', 'asia', 'europe', 'north america', 'oceania', 'south america']

  has_many :taggings
  has_many :articles, through: :taggings, source: :taggable, source_type: Article

  validates :name, presence: true

  scope :regions, -> { where(name: REGIONS) }
  scope :without_regions, -> { where.not(name: REGIONS) }
  default_scope { order(:name) }

  def to_param
    name.parameterize
  end
end
