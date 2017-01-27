module Admin
  class ProductTypesController < BaseController
    before_action :set_product_type, only: [:edit, :update, :destroy]

    def index
      @product_types = ProductType.all
    end

    def new
      @product_type = ProductType.new
    end

    def edit
    end

    def create
      @product_type = ProductType.new(product_type_params)

      if @product_type.save
        redirect_to admin_product_types_path, notice: %(Saved "#{@product_type.name}" successfully.)
      else
        render :new
      end
    end

    def update
      if @product_type.update(product_type_params)
        redirect_to admin_product_types_path, notice: %(Updated "#{@product_type.name} successfully.")
      else
        render :edit
      end
    end

    def destroy
      @product_type.destroy
      redirect_to admin_product_types_path, notice: %(Deleted #{@product_type.name} successfully.)
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
    end

    def product_type_params
      params.require(:product_type).permit(:name, :hero_image, :icon_image)
    end
  end
end
