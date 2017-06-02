class TrainingEventRequest
  include ActiveModel::Model
  
  attr_accessor :company_name,
                :full_name,
                :email,
                :phone,
                :address,
                :locality,
                :region,
                :postal_code,
                :country_id,
                :started_at,
                :ended_at,
                :capacity,
                :training_course_ids

  validates :company_name,
            :full_name,
            :phone,
            :address,
            :locality,
            :region,
            :postal_code,
            :country_id,
            :started_at,
            :ended_at,
            presence: true

  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[\w\-.]+\.[a-z]+\z/i }
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
