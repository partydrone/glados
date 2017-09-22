Globalize.with_locale(@translation_locale) do
  json.(@product, :id, :summary, :description, :youtube_video_id)
end
