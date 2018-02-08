Mobility.with_locale(@translation_locale) do
  json.(@download, :id, :title)
  json.file (@download.file.url)
end
