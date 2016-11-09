class FeaturesController < ApplicationController
  before_action :set_feature, only: [:show, :edit, :update, :destroy]
  before_action :set_product_types, only: [:new, :edit]

  def index
    @features = Feature.all
  end

  def show
  end

  def new
    @feature = Feature.new
  end

  def edit
  end

  def create
    @feature = Feature.new(feature_params)

    if @feature.save
      redirect_to @feature, notice: %(Saved "#{@feature.title}" successfully.)
    else
      set_product_types
      render :new
    end
  end

  def update
    if @feature.update(feature_params)
      redirect_to @feature, notice: %(Updated "#{@feature.title}" successfully.)
    else
      set_product_types
      render :edit
    end
  end

  def destroy
    @feature.destroy
    redirect_to features_path, notice: %(Deleted "#{@feature.title}" successfully.)
  end

  private

  def set_feature
    @feature = Feature.find(params[:id])
  end

  def feature_params
    params.require(:feature).permit(:title, :description, :youtube_video_id, :billboard, :body, product_ids: [])
  end

  def set_product_types
    @product_types = ProductType.includes(:products).reorder(:position).order('products.name')
  end
end
