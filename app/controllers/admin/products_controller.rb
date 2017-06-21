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

      render 'products/show'
    end

    def new
      @product = Product.new
      authorize @product
    end

    def edit
    end

    def create
      @product = Product.new(product_params)
      authorize @product

      if @product.save
        redirect_to admin_product_categories_path, notice: %(Saved "#{@product.name}" successfully.)
      else
        render :new
      end
    end

    def update
      if @product.update(product_params)
        redirect_to [:admin, @product], notice: %(Updated "#{@product.name} successfully.")
      else
        render :edit
      end
    end

    def destroy
      @product.destroy
      redirect_to admin_products_path, notice: %(Deleted #{@product.name} successfully.)
    end

    private

    def set_product
      @product = Product.find(params[:id])
      authorize @product
    end

    def product_params
      params.require(:product).permit(:name, :part_number, :matured_on, :expired_on, :summary, :description, :product_image, :remove_product_image, :hero_image, :remove_hero_image, :youtube_video_id, :product_category_id)
    end
  end
end
