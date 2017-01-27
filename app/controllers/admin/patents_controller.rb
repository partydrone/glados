module Admin
  class PatentsController < BaseController
    before_action :set_patent, only: [:edit, :update, :destroy]
    before_action :set_product_types, only: [:new, :edit]

    def index
      @patents = Patent.all
    end

    def new
      @patent = Patent.new
    end

    def edit
    end

    def create
      @patent = Patent.new(patent_params)

      if @patent.save
        redirect_to admin_patents_path, notice: %(Saved "#{@patent.title}" successfully.)
      else
        set_product_types
        render :new
      end
    end

    def update
      if @patent.update(patent_params)
        redirect_to admin_patents_path, notice: %(Updated "#{@patent.title}" successfully.)
      else
        set_product_types
        render :edit
      end
    end

    def destroy
      @patent.destroy
      redirect_to admin_patents_path, notice: %(Deleted "#{@patent.title}" successfully.)
    end

    private

    def set_patent
      @patent = Patent.find(params[:id])
    end

    def patent_params
      params.require(:patent).permit(:number, :title, product_ids: [])
    end

    def set_product_types
      @product_types = ProductType.includes(:products).reorder(:position).order('products.name')
    end
  end
end
