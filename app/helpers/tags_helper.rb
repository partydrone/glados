module TagsHelper
  def render_tags_for(object)
    raw object.tags.map { |t| link_to t.name, tag_path(t) }.join(', ') if object.respond_to? :tags
  end
end
