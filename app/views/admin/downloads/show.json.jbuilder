Mobility.with_locale(@translation_locale) do
  json.(@download, :id, :title)
  json.file (attachment_url(@download, :file, filename: @download.title.parameterize))
end
