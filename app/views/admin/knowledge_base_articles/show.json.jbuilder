Globalize.with_locale(@translation_locale) do
  json.(@knowledge_base_article, :id, :title, :subtitle, :body)
end
