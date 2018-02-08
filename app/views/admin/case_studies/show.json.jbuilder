Mobility.with_locale(@translation_locale) do
  json.(@case_study, :id, :title, :subtitle, :body)
end
