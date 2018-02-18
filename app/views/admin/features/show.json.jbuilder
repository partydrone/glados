Mobility.with_locale(@translation_locale) do
  json.(@feature, :id, :title, :description, :youtube_video_id, :body)
end
