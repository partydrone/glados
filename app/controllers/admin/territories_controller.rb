module Admin
  class TerritoriesController < BaseController
  	before_action :set_territory, only: [:edit, :show, :update, :destroy]

  	def index
      @territories = Territory.all
    end

    def show
    end

  	def new
      @territory = Territory.new
    end

    def edit
    end

    def create
      @territory = Territory.new(territory_params)

      if @territory.save
        redirect_to admin_territories_path, notice: %(Saved "#{@territory.name}" successfully.)
      else
        render :new
      end
    end

    def update
      if @territory.update(territory_params)
        redirect_to admin_territory_path(@territory), notice: %(Updated "#{@territory.name}" successfully.)
      else
        render :edit
      end
    end

    def destroy
      @territory.destroy
      redirect_to admin_territories_path, notice: %(Deleted "#{@territory.name}" successfully.)
    end

    private

    def set_territory
      @territory = Territory.find(params[:id])
    end

    def territory_params
      params.require(:territory).permit(:name, :country, :dealer, :office)
    end

  end
end