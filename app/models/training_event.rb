class TrainingEvent < ApplicationRecord
  has_many :training_courses
  has_many :training_event_courses, dependent: :destroy
  has_many :training_courses, -> { uniq }, through: :training_event_courses

  accepts_nested_attributes_for :training_event_courses, allow_destroy: true

  validates :title, :description, :started_at, :ended_at, :location, presence: true
  validate :starts_before_ends

  def start_time
    if self.training_event_courses.length > 0
      self.training_event_courses.order(:started_at).first.started_at.strftime("%I:%M %p")
    else
      nil
    end
  end

  def to_param
    "#{id} #{title}".parameterize
  end

  protected

  def starts_before_ends
    if (started_at && ended_at) && started_at > ended_at
      errors.add(:ended_at, "can't be earlier than start date")
    end
  end
end
