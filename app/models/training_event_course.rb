class TrainingEventCourse < ApplicationRecord
  belongs_to :training_event
  belongs_to :training_course
  has_many :enrollments
end
