module Admin
  class DownloadTypesController < BaseController
    before_action :set_download_type, only: [:edit, :update, :destroy]

    def index
      @download_types = DownloadType.all
    end

    def new
      @download_type = DownloadType.new
    end

    def edit
    end

    def create
      @download_type = DownloadType.new(download_type_params)

      if @download_type.save
        redirect_to admin_download_types_path, notice: %(Saved "#{@download_type.name}" successfully.)
      else
        render :new
      end
    end

    def update
      if @download_type.update(download_type_params)
        redirect_to admin_download_types_path, notice: %(Updated "#{@download_type.name} successfully.")
      else
        render :edit
      end
    end

    def destroy
      @download_type.destroy
      redirect_to admin_download_types_path, notice: %(Deleted #{@download_type.name} successfully.)
    end

    def sort
      params[:download_type].each_with_index do |id, index|
        DownloadType.where(id: id).update_all({position: index + 1})
      end
      head :no_content
    end

    private

    def set_download_type
      @download_type = DownloadType.find(params[:id])
    end

    def download_type_params
      params.require(:download_type).permit(:name)
    end
  end
end
