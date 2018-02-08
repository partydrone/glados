module Admin
  class FeaturesController < BaseController
    before_action :set_feature, only: [:show, :edit, :update, :destroy]
    before_action :set_product_types, only: [:new, :edit]

    def index
      @features = Feature.order(:title)
      authorize @features
    end

    def show
      @translation_locale = params[:translation_locale] || I18n.locale
    end

    def new
      @feature = Feature.new
      authorize @feature
    end

    def edit
    end

    def create
      Mobility.with_locale(params[:translation_locale]) do
        @feature = Feature.new(feature_params)
        authorize @feature

        if @feature.save
          redirect_to [:admin, @feature], notice: %(Saved "#{@feature.title}" successfully.)
        else
          set_product_types
          render :new
        end
      end
    end

    def update
      Mobility.with_locale(params[:translation_locale]) do
        if @feature.update(feature_params)
          redirect_to [:admin, @feature], notice: %(Updated "#{@feature.title}" successfully.)
        else
          set_product_types
          render :edit
        end
      end
    end

    def destroy
      translation_locale = params[:translation_locale]

      if translation_locale
        if @feature.translations.count > 1
          Mobility.with_locale(translation_locale) do
            @feature.translation.destroy
            message = %(Deleted #{helpers.humanize_locale translation_locale} translation successfully.)
          end
        else
          message = %(#{helpers.humanize_locale translation_locale} is the only translation left and cannot be deleted. Delete the record, instead.)
        end
      else
        @feature.destroy
        message = %(Deleted #{@feature.name} successfully.)
      end

      redirect_to admin_features_path, notice: message
    end

    private

    def set_feature
      @feature = Feature.find(params[:id])
      authorize @feature
    end

    def feature_params
      params.require(:feature).permit(:title, :description, :youtube_video_id, :hero_image, :remove_hero_image, :body, :tag_list, product_ids: [])
    end

    def set_product_types
      @product_types = ProductType.includes(:products).reorder(:position).order('products.name')
    end
  end
end
