class Article < ApplicationRecord
  include Taggable

  attachment :hero_image, content_type: %w(image/jpeg image/png image/gif)

  validates :title, :body, :posted_on, presence: true

  scope :current, -> { where 'posted_on < ?', Date.tomorrow }

  def to_param
    "#{id}-#{title.parameterize}"
  end
end
