module Admin
  class MediaDownloadsController < BaseController
    before_action :set_media_download, only: [:edit, :update, :destroy]

    def index
      @media_downloads = MediaDownload.order(:file_filname)
      authorize @media_downloads
    end

    def new
      @media_download = MediaDownload.new
      authorize @media_download
    end

    def edit
    end

    def create
      @media_download = MediaDownload.new(media_download_params)
      authorize @media_download

      if @media_download.save
        redirect_to admin_media_downloads_path, notice: %(Saved media file successfully.)
      else
        render :new
      end
    end

    def update
      if @media_download.update(media_download_params)
        redirect_to admin_media_downloads_path, notice: %(Updated media file successfully.)
      else
        render :edit
      end
    end

    def destroy
      @media_download.destroy
      redirect_to admin_media_downloads_path, notice: %(Deleted media file successfully.)
    end

    private

    def set_media_download
      @media_download = MediaDownload.find(params[:id])
      authorize @media_download
    end

    def media_download_params
      params.require(:media_download).permit(:description, :file)
    end
  end
end
