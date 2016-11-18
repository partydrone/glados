class Patent < ActiveRecord::Base
  has_and_belongs_to_many :products

  validates :number, presence: true, numericality: { only_integer: true }, uniqueness: true
  validates :title, presence: true

  default_scope { order('number') }
end
