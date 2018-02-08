module Admin
  class DownloadTypesController < BaseController
    before_action :set_download_type, only: [:show, :edit, :update, :destroy]

    def index
      @download_types = DownloadType.all
      authorize @download_types
    end

    def show
      @translation_locale = params[:translation_locale]
    end

    def new
      @download_type = DownloadType.new
      authorize @download_type
    end

    def edit
    end

    def create
      Mobility.with_locale(params[:translation_locale]) do
        @download_type = DownloadType.new(download_type_params)
        authorize @download_type

        if @download_type.save
          redirect_to admin_download_types_path, notice: %(Saved "#{@download_type.name}" successfully.)
        else
          render :new
        end
      end
    end

    def update
      Mobility.with_locale(params[:translation_locale]) do
        if @download_type.update(download_type_params)
          redirect_to admin_download_types_path, notice: %(Updated "#{@download_type.name} successfully.")
        else
          render :edit
        end
      end
    end

    def destroy
      translation_locale = params[:translation_locale]

      if translation_locale
        if @download_type.translations.count > 1
          Mobility.with_locale(translation_locale) do
            @download_type.translation.destroy
            message = %(Deleted #{helpers.humanize_locale translation_locale} translation successfully.)
          end
        else
          message = %(#{helpers.humanize_locale translation_locale} is the only translation left and cannot be deleted. Delete the record, instead.)
        end
      else
        @download_type.destroy
        message = %(Deleted #{@download_type.name} successfully.)
      end

      redirect_to admin_download_types_path, notice: message
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
      authorize @download_type
    end

    def download_type_params
      params.require(:download_type).permit(:name)
    end
  end
end
