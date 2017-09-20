module Admin
  class ProductCategoriesController < BaseController
    before_action :set_product_category, only: [:edit, :update, :destroy]

    def index
      @product_categories = ProductCategory.includes(:product_type)
      authorize @product_categories
    end

    def show
      @product_category = ProductCategory.includes(:products).find(params[:id])
      authorize @product_category
      @translation_locale = params[:translation_locale] || I18n.locale
    end

    def new
      @product_category = ProductCategory.new
      authorize @product_category
    end

    def edit
    end

    def create
      Globalize.with_locale(params[:translation_locale]) do
        @product_category = ProductCategory.new(product_category_params)
        authorize @product_category

        if @product_category.save
          redirect_to admin_product_categories_path, notice: %(Saved "#{@product_category.name}" successfully.)
        else
          render :new
        end
      end
    end

    def update
      Globalize.with_locale(params[:translation_locale]) do
        if @product_category.update(product_category_params)
          redirect_to admin_product_categories_path, notice: %(Updated "#{@product_category.name} successfully.")
        else
          render :edit
        end
      end
    end

    def destroy
      translation_locale = params[:translation_locale]

      if translation_locale
        if @product_category.translations.count > 1
          Globalize.with_locale(translation_locale) do
            @product_category.translation.destroy
            message = %(Deleted #{helpers.humanize_locale translation_locale} translation successfully.)
          end
        else
          message = %(#{helpers.humanize_locale translation_locale} is the only translation left and cannot be deleted. Delete the record, instead.)
        end
      else
        @product_category.destroy
        message = %(Deleted #{@product_category.name} successfully.)
      end

      redirect_to admin_product_categories_path, notice: message
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
      authorize @product_category
    end

    def product_category_params
      params.require(:product_category).permit(:name, :description, :hero_image, :icon_image, :product_type_id)
    end
  end
end
