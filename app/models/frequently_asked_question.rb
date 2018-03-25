class FrequentlyAskedQuestion < ApplicationRecord
  belongs_to :faq_topic

  validates :question, :answer, presence: true
end
