class ProductCategoriesController < ApplicationController
  before_action :set_product_category, only: [:edit, :update, :destroy]

  def index
    @product_categories = ProductCategory.includes(:product_type)
  end

  def list
    @product_categories = ProductCategory.includes(:product_type)
  end

  def show
    @product_category = ProductCategory.includes(:products).find(params[:id])
  end

  def new
    @product_category = ProductCategory.new
  end

  def edit
  end

  def create
    @product_category = ProductCategory.new(product_category_params)

    if @product_category.save
      redirect_to product_categories_path, notice: %(Saved "#{@product_category.name}" successfully.)
    else
      render :new
    end
  end

  def update
    if @product_category.update(product_category_params)
      redirect_to product_categories_path, notice: %(Updated "#{@product_category.name} successfully.")
    else
      render :edit
    end
  end

  def destroy
    @product_category.destroy
    redirect_to product_categories_path, notice: %(Deleted #{@product_category.name} successfully.)
  end

  def sort
    params[:product_category].each_with_index do |id, index|
      ProductCategory.where(id: id).update_all({position: index + 1})
    end
    head :no_content
  end

  private

  def set_product_category
    @product_category = ProductCategory.find(params[:id])
  end

  def product_category_params
    params.require(:product_category).permit(:name, :product_type_id)
  end
end
