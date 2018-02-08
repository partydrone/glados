module Admin
  class DownloadsController < BaseController
    before_action :set_download, only: [:show, :edit, :update, :destroy]
    before_action :set_product_types, only: [:new, :edit]

    def index
      @downloads = Download.includes(:download_type).order(:title)
      authorize @downloads
    end

    def show
      @translation_locale = params[:translation_locale]
    end

    def new
      @download = Download.new
      authorize @download
    end

    def edit
    end

    def create
      Mobility.with_locale(params[:translation_locale]) do
        @download = Download.new(download_params)
        authorize @download

        if @download.save
          redirect_to admin_downloads_path, notice: %(Saved "#{@download.title}" successfully.)
        else
          set_product_types
          render :new
        end
      end
    end

    def update
      Mobility.with_locale(params[:translation_locale]) do
        if @download.update(download_params)
          redirect_to admin_downloads_path, notice: %(Updated "#{@download.title}" successfully.)
        else
          set_product_types
          render :edit
        end
      end
    end

    def destroy
      translation_locale = params[:translation_locale]

      if translation_locale
        if @download.translations.count > 1
          Mobility.with_locale(translation_locale) do
            @download.translation.destroy
            message = %(Deleted "#{helpers.humanize_locale translation_locale}" translation successfully.)
          end
        else
          message = %(#{helpers.humanize_locale translation_locale} is the only translation left and cannot be deleted. Delete the record, instead.)
        end
      else
        @download.destroy
        message = %(Deleted "#{@download.title}" successfully.)
      end

      redirect_to admin_downloads_path, notice: message
    end

    private

    def set_download
      @download = Download.find(params[:id])
      authorize @download
    end

    def download_params
      params.require(:download).permit(:title, :download_type_id, :file, product_ids: [])
    end

    def set_product_types
      @product_types = ProductType.includes(:products).reorder(:position).order('products.name')
    end
  end
end
