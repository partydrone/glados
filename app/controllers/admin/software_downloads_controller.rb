module Admin
  class SoftwareDownloadsController < BaseController
    before_action :set_software_download, only: [:edit, :update, :destroy]
    before_action :set_product_types, only: [:new, :edit]

    def index
      @software_downloads = SoftwareDownload.order(:title)
      authorize @software_downloads
    end

    def new
      @software_download = SoftwareDownload.new
      authorize @software_download
    end

    def edit
    end

    def create
      @software_download = SoftwareDownload.new(software_download_params)
      authorize @software_download

      if @software_download.save
        redirect_to admin_software_downloads_path, notice: %(Saved "#{@software_download.title}" successfully.)
      else
        set_product_types
        render :new
      end
    end

    def update
      if @software_download.update(software_download_params)
        redirect_to admin_software_downloads_path, notice: %(Updated "#{@software_download.title}" successfully.)
      else
        set_product_types
        render :edit
      end
    end

    def destroy
      @software_download.destroy
      redirect_to admin_software_downloads_path, notice: %(Deleted "#{@software_download.title}" successfully.)
    end

    private

    def set_software_download
      @software_download = SoftwareDownload.find(params[:id])
      authorize @software_download
    end

    def software_download_params
      params.require(:software_download).permit(:title, :file, product_ids: [])
    end

    def set_product_types
      @product_types = ProductType.includes(:products).reorder(:position).order('products.name')
    end
  end
end
