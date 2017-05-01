module Admin
  class DownloadsController < BaseController
    before_action :set_download, only: [:edit, :update, :destroy]
    before_action :set_product_types, only: [:new, :edit]

    def index
      @downloads = Download.all
    end

    def new
      @download = Download.new(locale: locale)
    end

    def edit
    end

    def create
      @download = Download.new(download_params)

      if @download.save
        redirect_to admin_downloads_path, notice: %(Saved "#{@download.title}" successfully.)
      else
        set_product_types
        render :new
      end
    end

    def update
      if @download.update(download_params)
        redirect_to admin_downloads_path, notice: %(Updated "#{@download.title}" successfully.)
      else
        set_product_types
        render :edit
      end
    end

    def destroy
      @download.destroy
      redirect_to admin_downloads_path, notice: %(Deleted "#{@download.title}" successfully.)
    end

    private

    def set_download
      @download = Download.find(params[:id])
    end

    def download_params
      params.require(:download).permit(:locale, :title, :part_number, :download_type_id, :file, product_ids: [])
    end

    def set_product_types
      @product_types = ProductType.includes(:products).reorder(:position).order('products.name')
    end
  end
end
