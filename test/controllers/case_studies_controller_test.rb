require 'test_helper'

describe CaseStudiesController, :locale do
  it "gets show" do
    get case_study_path(case_studies(:new_case_study))
    must_respond_with :success
  end
end
