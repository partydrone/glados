require 'test_helper'

describe EnrollmentsController, :locale do

it "gets show" do
    get enrollment_path(training_events(:training_event))
    must_respond_with :success
  end

 it "creates a enrollment" do
    -> {
      post enrollments_path, params: {
        enrollment: {
          training_event_id: 10,
          first_name: 'John',
          last_name: 'Doe',
          email: 'john@doe.com',
          training_event_course_id: ["",1]
        }
      }
    }.must_change 'Enrollment.count'    
    must_redirect_to enrollment_path(training_events(:training_event))
  end

end