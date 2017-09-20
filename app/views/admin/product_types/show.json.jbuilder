Globalize.with_locale(@translation_locale) do
  json.(@product_type, :id, :name)
end
