class Article < ApplicationRecord
  attachment :hero_image, content_type: %w(image/jpeg image/png image/gif)

  validates :title, :body, presence: true

  default_scope { order(posted_on: :desc) }

  def to_param
    "#{id}-#{title.parameterize}"
  end
end
