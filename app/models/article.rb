class Article < ApplicationRecord
  attachment :hero_image, content_type: %w(image/jpeg image/png image/gif)

  validates :title, :body, presence: true

  scope :current, -> { where 'posted_on < ?', Date.tomorrow }

  def to_param
    "#{id}-#{title.parameterize}"
  end
end
