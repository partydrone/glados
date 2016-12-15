class Download < ApplicationRecord
  belongs_to :download_type
  has_and_belongs_to_many :products

  attachment :file

  validates :locale, :title, presence: true

  default_scope { order(:title) }

  def to_param
    "#{id}-#{title.parameterize}"
  end
end
