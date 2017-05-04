module Admin
  class OfficesController < BaseController
  	before_action :set_office, only: [:edit, :show, :update, :destroy]

    def index
      @offices = Office.all
      authorize @offices
    end

    def show
    end

    def new
      @office = Office.new
      authorize @office
    end

    def edit
    end

    def create
      @office = Office.new(office_params)
      authorize @office

      if @office.save
        redirect_to admin_offices_path, notice: %(Saved "#{@office.name}" successfully.)
      else
        render :new
      end
    end

    def update
      if @office.update(office_params)
        redirect_to admin_office_path(@office), notice: %(Updated "#{@office.name}" successfully.)
      else
        render :edit
      end
    end

    def destroy
      @office.destroy
      redirect_to admin_offices_path, notice: %(Deleted "#{@office.name}" successfully.)
    end

    def sort
      params[:office].each_with_index do |id, index|
        Office.where(id: id).update_all({position: index + 1})
      end
      head :no_content
    end

    private

    def set_office
      @office = Office.find(params[:id])
      authorize @office
    end

    def office_params
      params.require(:office).permit(:name, :address, :city, :region, :zip, :country, :phone, :email)
    end

  end
end
