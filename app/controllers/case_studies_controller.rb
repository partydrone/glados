class CaseStudiesController < ApplicationController
  def show
    @case_study = CaseStudy.find(params[:id])
    @case_study.log_view unless browser.bot?
    # LogArticleViewJob.perform_later @case_study unless browser.bot?
  end
end
