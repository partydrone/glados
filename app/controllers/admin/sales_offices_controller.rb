module Admin
  class SalesOfficesController < BaseController
  	before_action :set_sales_office, only: [:edit, :show, :update, :destroy]

    def index
      @sales_offices = SalesOffice.order(:country_id, :name)
      authorize @sales_offices
    end

    def show
    end

    def new
      @sales_office = SalesOffice.new
      authorize @sales_office
    end

    def edit
    end

    def create
      @sales_office = SalesOffice.new(sales_office_params)
      authorize @sales_office

      if @sales_office.save
        redirect_to admin_sales_offices_path, notice: %(Saved "#{@sales_office.name}" successfully.)
      else
        render :new
      end
    end

    def update
      if @sales_office.update(sales_office_params)
        redirect_to admin_sales_office_path(@sales_office), notice: %(Updated "#{@sales_office.name}" successfully.)
      else
        render :edit
      end
    end

    def destroy
      @sales_office.destroy
      redirect_to admin_sales_offices_path, notice: %(Deleted "#{@sales_office.name}" successfully.)
    end

    private

    def set_sales_office
      @sales_office = SalesOffice.find(params[:id])
      authorize @sales_office
    end

    def sales_office_params
      params.require(:sales_office).permit(:name, :address, :locality, :region, :postal_code, :country, :phone, :email)
    end

  end
end
