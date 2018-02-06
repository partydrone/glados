class MediaDownload < ApplicationRecord
  attachment :file, content_type: %w(image/jpeg image/png image/gif)

  validates :description, presence: true
  validates :file, presence: true, on: :create

  def self.available(locale = I18n.locale)
    locale =~ /^([a-z]{2,2})(?:[-|_]([A-Z]{2,2}))?$/i
    query = where("'#{$2}' = ANY (country_ids)")

    if query.exists?
      query
    else
      all
    end
  end
end
