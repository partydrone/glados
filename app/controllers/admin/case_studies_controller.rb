module Admin
  class CaseStudiesController < BaseController
    before_action :set_case_study, only: [:show, :edit, :update, :destroy]
    before_action :set_regions, only: [:new, :edit]
    before_action :set_tags, only: [:new, :edit]

    def index
      @case_studies = CaseStudy.order(updated_at: :desc)
      authorize @case_studies
    end

    def show
      @article = @case_study
      @translation_locale = params[:translation_locale] || I18n.locale

      respond_to do |format|
        format.html
        format.json
      end
    end

    def new
      @case_study = CaseStudy.new(flag: 'US')
      authorize @case_study
    end

    def edit
    end

    def create
      Mobility.with_locale(params[:translation_locale]) do
        @case_study = CaseStudy.new(case_study_params)
        authorize @case_study

        if @case_study.save
          redirect_to [:admin,@case_study], notice: %(Saved "#{@case_study.title}" successfully.)
        else
          render :new
        end
      end
    end

    def update
      Mobility.with_locale(params[:translation_locale]) do
        if @case_study.update(case_study_params)
          redirect_to [:admin,@case_study], notice: %(Updated "#{@case_study.title}" successfully.)
        else
          render :edit
        end
      end
    end

    def destroy
      translation_locale = params[:translation_locale]

      if translation_locale
        if @case_study.translations.count > 1
          Mobility.with_locale(translation_locale) do
            @case_study.translation.destroy
            message = %(Deleted #{helpers.humanize_locale translation_locale} translation successfully.)
          end
        else
          message = %(#{helpers.humanize_locale translation_locale} is the only translation left and cannot be deleted. Delete the record, instead.)
        end
      else
        @case_study.destroy
        message = %(Deleted "#{@case_study.title}" successfully.)
      end

      redirect_to admin_case_studies_path, notice: message
    end

    private

    def set_case_study
      @case_study = CaseStudy.find(params[:id])
      authorize @case_study
    end

    def case_study_params
      params.require(:case_study).permit(:title, :subtitle, :location, :flag, :hero_image, :body, :posted_on, :region_list, :tag_list)
    end

    def set_regions
      @regions = ActsAsTaggableOn::Tag.for_context(:regions).uniq.pluck(:name)
    end

    def set_tags
      @tags = ActsAsTaggableOn::Tag.for_context(:tags).uniq.pluck(:name)
    end
  end
end
