class ProductsController < ApplicationController
  def index
    @product_categories = ProductCategory.available.active.where(product_type: ProductType.first)
    @product_types      = ProductType.available.active[1..-1]
  end

  def show
    @product            = Product.includes(:product_category).find(params[:id])

    @features           = @product.features.joins(:translations).where(feature_translations: { locale: [I18n.locale] })
    @training_courses   = @product.training_courses
    @software_downloads = @product.software_downloads
    @downloads          = @product.downloads.includes(:download_type).joins(:translations).where(download_translations: { locale: [I18n.locale] })
  end
end
