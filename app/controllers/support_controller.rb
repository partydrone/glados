class SupportController < ApplicationController
  def index
    @product_types = ProductType.available
    @products = Product.joins(:frequently_asked_questions, product_category: :product_type).select(:id, :name).reorder('product_types.position, products.name')
    @return_material_authorization_policy_document = ReturnMaterialAuthorizationPolicyDocument.current
  end

  def select_product
    @product = Product.find(params[:product])
    redirect_to product_path(@product, anchor: 'support') if params[:product]
  end
end
