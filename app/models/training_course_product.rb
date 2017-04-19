class TrainingCourseProduct < ApplicationRecord
  belongs_to :training_course
  belongs_to :product

  default_scope { order(:position) }
end
