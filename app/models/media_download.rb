class MediaDownload < ApplicationRecord
  attachment :file, content_type: %w(image/jpeg image/png image/gif)

  validates :description, presence: true
end
