class TrainingEventCourse < ApplicationRecord
  belongs_to :training_event
  belongs_to :training_course
  has_many :enrollments

  accepts_nested_attributes_for :enrollments, allow_destroy: true

  def title
    training_course.title
  end

  def title_by_id(id)
    begin
      TrainingCourse.find(id).title
    rescue =>
      TrainingCourse.find(1).title
    end
  end

  def get_enrollments(seats,id)
    seats - Enrollment.where("training_event_course_id = ?", id).count
  end

end
