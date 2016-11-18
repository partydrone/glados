require 'test_helper'

describe CaseStudiesController, :locale do
  let(:case_study) { case_studies(:new_case_study) }

  it "gets index" do
    get case_studies_path
    must_respond_with :success
  end

  it "gets new" do
    get new_case_study_path
    must_respond_with :success
  end

  it "creates a blog post" do
    -> {
      post case_studies_path, params: {
        case_study: {
          title: 'System One',
          subtitle: 'Meet the new memeber of the Wavetronix family.',
          location: 'Florida',
          flag: 'us',
          body: 'System one has been five years in the making, and it is totally worth the wait!',
          posted_on: Date.today.to_s(:db)
        }
      }
    }.must_change 'CaseStudy.count'
    flash[:notice].wont_be_nil
    must_redirect_to case_study_path(CaseStudy.last)
  end

  it "gets show" do
    get case_study_path(case_study)
    must_respond_with :success
  end

  it "gets edit" do
    get edit_case_study_path(case_study)
    must_respond_with :success
  end

  it "updates a blog post" do
    patch case_study_path(case_study), params: {
      case_study: {
        title: case_study.title
      }
    }
    must_redirect_to case_study_path(case_study)
  end

  it "destroys a blog post" do
    -> {
      delete case_study_path(case_study)
    }.must_change 'CaseStudy.count', -1
    must_redirect_to case_studies_path
  end
end
