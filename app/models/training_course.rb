class TrainingCourse < ApplicationRecord  
  #relation with training course types
  belongs_to :training_course_type
  #relation with training events
  has_many :training_event_courses
  has_many :training_events, -> {uniq}, through: :training_event_courses
  #relation with itself for prerequistes
  has_and_belongs_to_many :prerequisites, class_name: "TrainingCourse", join_table: "prerequisites_training_courses", association_foreign_key: "prerequisite_id"

  accepts_nested_attributes_for :prerequisites, allow_destroy: true

   #attr_accessor :training_course_ids

  validates :title, :description, presence: true
  validates :duration, numericality: { only_integer: true }, if: 'duration.present?'  

  def full_title
    "#{number + ' - ' if number.present?}#{title}"
  end

  def to_param
    "#{id}-#{title.parameterize}"
  end
end
