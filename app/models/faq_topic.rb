class FaqTopic < ApplicationRecord
  has_many :frequently_asked_questions

  validates :title, presence: true
end
