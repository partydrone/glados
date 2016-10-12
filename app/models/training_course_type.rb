class TrainingCourseType < ApplicationRecord
  has_many :training_courses

  validates :name, presence: true

  default_scope { order('name') }

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
