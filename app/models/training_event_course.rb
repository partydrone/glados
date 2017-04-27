class TrainingEventCourse < ApplicationRecord
  belongs_to :training_event
  belongs_to :training_course
  has_many :enrollments, dependent: :destroy

  accepts_nested_attributes_for :enrollments, allow_destroy: true

  validates :started_at, :ended_at, :seats, presence: true

  def title
    training_course.title
  end

  def title_by_id(id)
      if (TrainingCourse.exists?(id)) then
        TrainingCourse.find(id).title
      end
  end

  def course_number_by_id(id)
    if (TrainingCourse.exists?(id)) then
        TrainingCourse.find(id).number
      end
  end

  def get_enrollments(seats,id)
    seats - Enrollment.where("training_event_course_id = ?", id).count
  end

end
