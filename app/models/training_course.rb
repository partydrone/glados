class TrainingCourse < ApplicationRecord    
  belongs_to :training_course_type  
  has_many :training_event_courses
  has_many :training_events, -> {uniq}, through: :training_event_courses    
  has_many :training_course_products, dependent: :destroy
  has_many :products, through: :training_course_products
  has_and_belongs_to_many :prerequisites, class_name: "TrainingCourse", join_table: "prerequisites_training_courses", association_foreign_key: "prerequisite_id"

  accepts_nested_attributes_for :prerequisites, allow_destroy: true

  validates :training_course_type, :title, :description, :summary, presence: true
  validates :duration, numericality: { only_integer: true }, if: 'duration.present?'

  attr_accessor :enrollments

  def full_title
    "#{number + ' - ' if number.present?}#{title}"
  end

  def to_param
    "#{id}-#{title.parameterize}"
  end
end
