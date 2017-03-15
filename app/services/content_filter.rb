class ContentFilter
  def initialize(collection)
    @collection = collection
  end

  def filter(filter_name)
    return @collection if @collection.empty?
    @collection.delete_if do |object|
      eval FILTERS[filter_name]
    end
  end
  
  FILTERS = {
    marketing_content: %(object.class == KnowledgeBaseArticle || (object.class == Feature && object.body.blank?)),
    support_content:   %(object.class != KnowledgeBaseArticle)
  }
end
