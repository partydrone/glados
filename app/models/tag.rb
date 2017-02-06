class Tag < ApplicationRecord
  has_many :taggings
  has_many :articles, through: :taggings, source: :taggable, source_type: Article

  validates :name, presence: true

  default_scope { order(:name) }

  def to_param
    name.parameterize
  end
end
