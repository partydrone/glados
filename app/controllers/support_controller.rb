class SupportController < ApplicationController
  def index
    @product_types = ProductType.includes(:products).select('product_types.name, product_types.icon_image_id, products.id, products.name').reorder('product_types.position', 'products.name')
    @top_kb_articles = KnowledgeBaseArticle.current.select(:id, :type, :title).order(views: :desc).limit(10)
    @return_material_authorization_policy_document = ReturnMaterialAuthorizationPolicyDocument.current
  end

  def select_product
    @product = Product.find(params[:product])
    redirect_to product_path(@product, anchor: 'support') if params[:product]
  end
end
