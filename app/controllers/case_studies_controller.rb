class CaseStudiesController < ApplicationController
  def show
    @case_study = CaseStudy.find(params[:id])
  end
end
