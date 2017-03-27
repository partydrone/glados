require 'test_helper'

describe TrainingEventRequestsController, :locale do
  
  it "should get new" do
    get new_training_event_request_path
    must_respond_with :success
  end


   it "creates a training event request" do    
    -> {
      
      post training_event_requests_path, params: {
        training_event_request: {
          company_name: 'wavetronix',
          full_name: 'John',
          email: 'john@doe.com',
          phone: '8016556556',
          address: '78 e 1700 s',
          city: 'provo',
          postal_code: '84606',
          region: 'UT',
          country: 'USA',
          started_at: '2017-02-06 20:45:30',
          ended_at: '2017-02-06 21:35:20',
          capacity: 50,
          training_course_ids: ["","7"]
        }      
      }
    }.wont_change 'TrainingCourse.count'
    must_redirect_to training_events_path
    
    
  end

  it "renders new on error" do
    skip 'TODO'
    -> {
      post training_event_requests_path, params: {
        training_event_request: {
          company_name: '',
          full_name: ''
        }
      }
    }    
  end

end