module Admin
  class SalesRegionsController < BaseController
    before_action :set_sales_region, only: [:edit, :update, :destroy]

    def index
      @sales_regions = SalesRegion.order(:position)
      authorize @sales_regions
    end

    def new
      @sales_region = SalesRegion.new
      authorize @sales_region
    end

    def edit
    end

    def create
      @sales_region = SalesRegion.new(sales_region_params)
      authorize @sales_region

      if @sales_region.save
        redirect_to admin_sales_regions_path, notice: %(Saved "#{@sales_region.name}" successfully.)
      else
        render :new
      end
    end

    def update
      if @sales_region.update(sales_region_params)
        redirect_to admin_sales_regions_path, notice: %(Updated "#{@sales_region.name} successfully.")
      else
        render :edit
      end
    end

    def destroy
      @sales_region.destroy
      redirect_to admin_sales_regions_path, notice: %(Deleted #{@sales_region.name} successfully.)
    end

    def sort
      params[:sales_region].each_with_index do |id, index|
        SalesRegion.where(id: id).update_all({position: index + 1})
      end
      head :no_content
    end

    private

    def set_sales_region
      @sales_region = SalesRegion.find(params[:id])
      authorize @sales_region
    end

    def sales_region_params
      params.require(:sales_region).permit(:name)
    end
  end
end
