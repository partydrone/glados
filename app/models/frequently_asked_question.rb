class FrequentlyAskedQuestion < ApplicationRecord
  belongs_to :faq_topic
  has_and_belongs_to_many :products

  validates :question, :answer, presence: true
end
