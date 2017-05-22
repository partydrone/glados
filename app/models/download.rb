class Download < ApplicationRecord
  belongs_to :download_type
  has_and_belongs_to_many :products

  attachment :file

  validates :locale, :title, presence: true

  def self.default_scope
    direction = "ASC, title ASC"
    order("
        CASE
          WHEN locale = 'en' THEN '1'
          WHEN locale != 'en' THEN '2'
        END #{direction}")
  end

  def to_param
    "#{id}-#{title.parameterize}"
  end
end
