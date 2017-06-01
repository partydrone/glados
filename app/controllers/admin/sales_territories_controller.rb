module Admin
  class SalesTerritoriesController < BaseController
  	before_action :set_sales_territory, only: [:edit, :show, :update, :destroy]

    def index
      @sales_territories = SalesTerritory.includes(:dealer, :sales_office, :sales_region).order('sales_regions.position, sales_offices.name, sales_territories.name')
      authorize @sales_territories
    end

    def show
    end

    def new
      @sales_territory = SalesTerritory.new
      authorize @sales_territory
    end

    def edit
    end

    def create
      @sales_territory = SalesTerritory.new(sales_territory_params)
      authorize @sales_territory
      if @sales_territory.save
        redirect_to admin_sales_territories_path, notice: %(Saved "#{@sales_territory.name}" successfully.)
      else
        render :new
      end
    end

    def update
      if @sales_territory.update(sales_territory_params)
        redirect_to admin_sales_territories_path, notice: %(Updated "#{@sales_territory.name}" successfully.)
      else
        render :edit
      end
    end

    def destroy
      @sales_territory.destroy
      redirect_to admin_sales_territories_path, notice: %(Deleted "#{@sales_territory.name}" successfully.)
    end

    private

    def set_sales_territory
      @sales_territory = SalesTerritory.find(params[:id])
      authorize @sales_territory
    end

    def sales_territory_params
      params.require(:sales_territory).permit(:name, :dealer, :sales_office_id, :sales_region_id)
    end

  end
end
