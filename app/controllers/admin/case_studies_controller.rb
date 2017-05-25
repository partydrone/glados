module Admin
  class CaseStudiesController < BaseController
    before_action :set_case_study, only: [:show, :edit, :update, :destroy]
    before_action :set_taggable_items, only: [:new, :edit]

    def index
      @case_studies = CaseStudy.order(posted_on: :desc)
      authorize @case_studies
    end

    def show
      @article = @case_study
    end

    def new
      @case_study = CaseStudy.new(flag: 'US')
      authorize @case_study
    end

    def edit
    end

    def create
      @case_study = CaseStudy.new(case_study_params)
      authorize @case_study

      if @case_study.save
        redirect_to [:admin,@case_study], notice: %(Saved "#{@case_study.title}" successfully.)
      else
        render :new
      end
    end

    def update
      if @case_study.update(case_study_params)
        redirect_to [:admin,@case_study], notice: %(Updated "#{@case_study.title}" successfully.)
      else
        render :edit
      end
    end

    def destroy
      @case_study.destroy
      redirect_to admin_case_studies_path, notice: %(Deleted "#{@case_study.title}" successfully.)
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
