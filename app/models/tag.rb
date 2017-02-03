class Tag < ApplicationRecord
  has_many :taggings
  has_many :blog_posts, through: :taggings, source: :taggable, source_type: BlogPost
  has_many :case_studies, through: :taggings, source: :taggable, source_type: CaseStudy

  validates :name, presence: true

  default_scope { order(:name) }
end
