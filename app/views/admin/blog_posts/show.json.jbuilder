Globalize.with_locale(@translation_locale) do
  json.(@blog_post, :id, :title, :subtitle, :body)
end
