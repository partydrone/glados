require 'test_helper'

describe Admin::TrainingCoursesController, :locale do
  let(:training_course) { training_courses(:smartsensor_hd_installation) }

  it "gets index" do
    get admin_training_courses_path
    must_respond_with :success
  end

  it "gets new" do
    get new_admin_training_course_path
    must_respond_with :success
  end

  it "creates a training course" do
    -> {
      post admin_training_courses_path, params: {
        training_course: {
          title: "How to Solve a Rubik's Cube",
          description: 'Learn all the skills, patterns, and tricks you need to know.',
          summary: 'solve in 5 moves',
          number: '410',
          duration: 4,
          training_course_type_id: training_course_types(:workshop).id
        }
      }
    }.must_change 'TrainingCourse.count'
    flash[:notice].wont_be_nil
    must_redirect_to admin_training_courses_path
  end

  # it "gets show" do
  #   get admin_training_course_path(training_course)
  #   must_respond_with :success
  # end

  it "gets edit" do
    get edit_admin_training_course_path(training_course)
    must_respond_with :success
  end

  it "updates a training course" do
    patch admin_training_course_path(training_course), params: {
      training_course: {
        title: training_course.title,
        summary: 'new summary'
      }
    }
    must_redirect_to admin_training_courses_path
  end

  it "destroys a training course" do
    -> {
      delete admin_training_course_path(training_course)
    }.must_change 'TrainingCourse.count', -1
    must_redirect_to admin_training_courses_path
  end
end
