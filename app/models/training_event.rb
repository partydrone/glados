class TrainingEvent < ApplicationRecord
  validates :title, :description, :started_at, :ended_at, :location, presence: true
  validate :starts_before_ends

  protected

  def starts_before_ends
    if (started_at && ended_at) && started_at > ended_at
      errors.add(:ended_at, "can't be earlier than start date")
    end
  end
end
