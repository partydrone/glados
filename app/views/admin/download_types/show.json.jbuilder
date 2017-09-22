Globalize.with_locale(@translation_locale) do
  json.(@download_type, :id, :name)
end
