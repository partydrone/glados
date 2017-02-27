class MarketingContentFilter
  def initialize(collection)
    @collection = collection
  end

  def filter
    return @collection if @collection.empty?
    @collection.delete_if do |object|
      object.class == KnowledgeBaseArticle ||
      (object.class == Feature && object.body.blank?)
    end
  end
end
