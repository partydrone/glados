class ProductsController < ApplicationController
  def index
    @product_categories = ProductCategory.available.active.where(product_type: ProductType.first)
    @product_types      = ProductType.available.active[1..-1]
  end

  def show
    @product            = Product.includes(:product_category).find(params[:id])

    @features           = @product.features.i18n.join_translations
    @training_courses   = @product.training_courses
    @software_downloads = @product.software_downloads
    @downloads          = @product.downloads.i18n.includes(:download_type).join_translations
  end

  def update
    @product = Product.find(params[:id])
    @product_downloads_translation_locale = params[:product_downloads_translation_locale]
    Mobility.with_locale(@product_downloads_translation_locale) do
      @downloads = @product.downloads.i18n.includes(:download_type).join_translations
    end
  end
end
