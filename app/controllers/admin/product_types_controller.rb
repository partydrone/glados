module Admin
  class ProductTypesController < BaseController
    before_action :set_product_type, only: [:show, :edit, :update, :destroy]

    def index
      @product_types = ProductType.all
      authorize @product_types
    end

    def show
      @translation_locale = params[:translation_locale] || I18n.locale
    end
    def new
      @product_type = ProductType.new
      authorize @product_type
    end

    def edit
    end

    def create
      Globalize.with_locale(params[:translation_locale]) do
        @product_type = ProductType.new(product_type_params)
        authorize @product_type

        if @product_type.save
          redirect_to admin_product_types_path, notice: %(Saved "#{@product_type.name}" successfully.)
        else
          render :new
        end
      end
    end

    def update
      Globalize.with_locale(params[:translation_locale]) do
        if @product_type.update(product_type_params)
          redirect_to admin_product_types_path, notice: %(Updated "#{@product_type.name} successfully.")
        else
          render :edit
        end
      end
    end

    def destroy
      translation_locale = params[:translation_locale]

      if translation_locale
        if @product_type.translations.count > 1
          Globalize.with_locale(translation_locale) do
            @product_type.translation.destroy
            message = %(Deleted #{helpers.humanize_locale translation_locale} translation successfully.)
          end
        else
          message = %(#{helpers.humanize_locale translation_locale} is the only translation left and cannot be deleted. Delete the record, instead.)
        end
      else
        @product_type.destroy
        message = %(Deleted #{@product_type.name} successfully.)
      end

      redirect_to admin_product_types_path, notice: message
    end

    def sort
      params[:product_type].each_with_index do |id, index|
        ProductType.where(id: id).update_all({position: index + 1})
      end
      head :no_content
    end

    private

    def set_product_type
      @product_type = ProductType.find(params[:id])
      authorize @product_type
    end

    def product_type_params
      params.require(:product_type).permit(:name, :hero_image, :icon_image)
    end
  end
end
