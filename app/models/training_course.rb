class TrainingCourse < ApplicationRecord
  belongs_to :training_course_type

  validates :title, :description, presence: true
  validates :duration, numericality: { only_integer: true }, if: 'duration.present?'
  validates :seats, numericality: { only_integer: true }, if: 'seats.present?'

  def full_title
    "#{number + ' - ' if number.present?}#{title}"
  end

  def to_param
    "#{id}-#{title.parameterize}"
  end
end
