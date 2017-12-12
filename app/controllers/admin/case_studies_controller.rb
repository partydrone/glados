module Admin
  class CaseStudiesController < BaseController
    before_action :set_case_study, only: [:show, :edit, :update, :destroy]
    before_action :set_taggable_items, only: [:new, :edit]

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
      Globalize.with_locale(params[:translation_locale]) do
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
      Globalize.with_locale(params[:translation_locale]) do
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
          Globalize.with_locale(translation_locle) do
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

      redirect_to admin_case_studys_path, notice: message
    end

    private

    def set_case_study
      @case_study = CaseStudy.find(params[:id])
      authorize @case_study
    end

    def case_study_params
      params.require(:case_study).permit(:title, :subtitle, :location, :flag, :hero_image, :body, :posted_on, :tag_list)
    end

    def set_taggable_items
      @taggable_items = Tag.pluck(:name)
    end

  end
end
