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
    marketing_content: %(
        ( object.class != BlogPost &&  object.class != CaseStudy && object.class != Feature ) ||
        ( object.class == BlogPost && !object.published? ) ||
        ( object.class == CaseStudy && !object.published? ) ||
        ( object.class == Feature && object.body.blank? )
     
      ),
    support_content:   %(object.class != KnowledgeBaseArticle),
    test: %(object.class == String)
  }
end


