require 'test_helper'

describe Admin::TrainingCourseTypesController, :locale do
  let(:training_course_type) { training_course_types(:workshop) }

  it "gets index" do
    get admin_training_course_types_path
    must_respond_with :success
  end

  it "gets new" do
    get new_admin_training_course_type_path
    must_respond_with :success
  end

  it "creates a training course type" do
    -> {
      post admin_training_course_types_path, params: {
        training_course_type: {
          name: 'Educational Event'
        }
      }
    }.must_change 'TrainingCourseType.count'
    flash[:notice].wont_be_nil
    must_redirect_to admin_training_course_types_path
  end

  # it "gets show" do
  #   get admin_training_course_type_path(training_course_type)
  #   must_respond_with :success
  # end

  it "gets edit" do
    get edit_admin_training_course_type_path(training_course_type)
    must_respond_with :success
  end

  it "updates a training course type" do
    patch admin_training_course_type_path(training_course_type), params: {
      training_course_type: {
        name: training_course_type.name
      }
    }
    must_redirect_to admin_training_course_types_path
  end

  it "destroys a training course type" do
    -> {
      delete admin_training_course_type_path(training_course_type)
    }.must_change 'TrainingCourseType.count', -1
    must_redirect_to admin_training_course_types_path
  end
end
