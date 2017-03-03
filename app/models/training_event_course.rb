class TrainingEventCourse < ApplicationRecord
  belongs_to :training_event
  belongs_to :training_course
  has_many :enrollments

  def title
    training_course.title
  end

  def get_enrollments(seats,id)
    seats - Enrollment.where("training_event_course_id = ?", id).count
  end

end
