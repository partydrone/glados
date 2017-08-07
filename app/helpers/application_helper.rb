module ApplicationHelper
  def full_title(page_title = nil)
    title = %w[Wavetronix]
    title << page_title if page_title.present?
    strip_tags title.join(' - ')
  end

  def humanize_locale(locale)
    locale =~ /^([a-z]{2,2})(?:[-|_]([A-Z]{2,2}))?$/i
    output = t("languages.#{$1}")
    output += " (#{t("countries.#{$2.try(:upcase)}")})" if $2
    return output
  end

  def markdown(text)
    options = {
      filter_html:         true,
      hard_wrap:           true,
      link_attributes:     { rel: 'nofollow', target: "_blank" },
      space_after_headers: true,
      fenced_code_blocks:  true
    }

    extensions = {
      autolink:                     true,
      superscript:                  true,
      disable_indented_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    sanitize markdown.render(text)
  end

  def set_class_for_content_type(content_type)
    return if content_type == nil
    content_type.parameterize
  end
end
