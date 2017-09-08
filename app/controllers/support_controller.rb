class SupportController < ApplicationController
  def index
    @product_types = ProductType.available
    @top_kb_articles = KnowledgeBaseArticle.top.limit(10)
    @return_material_authorization_policy_document = ReturnMaterialAuthorizationPolicyDocument.current
  end

  def select_product
    @product = Product.find(params[:product])
    redirect_to product_path(@product, anchor: 'support') if params[:product]
  end
end
