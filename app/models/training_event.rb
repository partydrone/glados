class TrainingEvent < ApplicationRecord
  has_many :training_courses
  has_many :training_event_courses
  has_many :training_courses, through: :training_event_courses

  accepts_nested_attributes_for :training_event_courses, allow_destroy: true

  validates :title, :description, :started_at, :ended_at, :location, presence: true
  validate :starts_before_ends

  protected

  def starts_before_ends
    if (started_at && ended_at) && started_at > ended_at
      errors.add(:ended_at, "can't be earlier than start date")
    end
  end
end
