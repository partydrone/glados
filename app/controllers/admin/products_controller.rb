module Admin
  class ProductsController < BaseController
    before_action :set_product, only: [:edit, :update, :destroy]

    def index
      @product_types = ProductType.includes(:products).reorder('product_types.position').order('products.name')
      authorize Product
    end

    def show
      @product = Product.includes({downloads: [:download_type]}, :features, :product_category).find(params[:id])
      authorize @product
      @demo_request = DemoRequest.new(country: 'US')
      @translation_locale = params[:translation_locale] || I18n.locale

      respond_to do |format|
        format.html { render 'products/show' }
        format.json
      end
    end

    def new
      @product = Product.new
      authorize @product
    end

    def edit
    end

    def create
      Globalize.with_locale(params[:translation_locale]) do
        @product = Product.new(product_params)
        authorize @product

        if @product.save
          redirect_to admin_product_categories_path, notice: %(Saved "#{@product.name}" successfully.)
        else
          render :new
        end
      end
    end

    def update
      Globalize.with_locale(params[:translation_locale]) do
        if @product.update(product_params)
          redirect_to [:admin, @product], notice: %(Updated "#{@product.name} successfully.")
        else
          render :edit
        end
      end
    end

    def destroy
      translation_locale = params[:translation_locale]

      if translation_locale
        if @product.translations.count > 1
          Globalize.with_locale(translation_locale) do
            @product.translation.destroy
            message = %(Deleted #{helpers.humanize_locale translation_locale} translation successfully.)
          end
        else
          message = %(#{helpers.humanize_locale translation_locale} is the only translation left and cannot be deleted. Delete the record, instead.)
        end
      else
        @product.destroy
        message = %(Deleted #{@product.name} successfully.)
      end

      redirect_to admin_products_path, notice: message
    end

    private

    def set_product
      @product = Product.find(params[:id])
      authorize @product
    end

    def product_params
      params.require(:product).permit(:name, :part_number, :matured_on, :expired_on, :summary, :description, :product_image, :remove_product_image, :hero_image, :remove_hero_image, :youtube_video_id, :product_category_id, country_ids: [])
    end
  end
end
