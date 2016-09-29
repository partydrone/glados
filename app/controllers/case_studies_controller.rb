class CaseStudiesController < ApplicationController
  before_action :set_case_study, only: [:show, :edit, :update, :destroy]

  def index
    @case_studies = CaseStudy.all
  end

  def show
  end

  def new
    @case_study = CaseStudy.new
  end

  def edit
  end

  def create
    @case_study = CaseStudy.new(case_study_params)

    if @case_study.save
      redirect_to @case_study, notice: %(Saved "#{@case_study.title}" successfully.)
    else
      render :new
    end
  end

  def update
    if @case_study.update(case_study_params)
      redirect_to @case_study, notice: %(Updated "#{@case_study.title}" successfully.)
    else
      render :edit
    end
  end

  def destroy
    @case_study.destroy
    redirect_to case_studies_path, notice: %(Deleted "#{@case_study.title}" successfully.)
  end

  private

  def set_case_study
    @case_study = CaseStudy.find(params[:id])
  end

  def case_study_params
    params.require(:case_study).permit(:title, :subtitle, :location, :flag, :body, :posted_on)
  end
end
