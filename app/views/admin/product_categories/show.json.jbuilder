Mobility.with_locale(@translation_locale) do
  json.(@product_category, :id, :name, :description)
end
