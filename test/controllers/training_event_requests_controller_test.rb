require 'test_helper'

describe TrainingEventRequestsController, :locale do
  it "should get new" do
    get new_training_event_request_path
    must_respond_with :success
  end

  it "sends an email" do
    -> {
      post training_event_requests_path, params: {
        training_event_request: {
          company_name: 'wavetronix',
          full_name: 'John',
          email: 'john@doe.com',
          phone: '8016556556',
          address: '78 e 1700 s',
          locality: 'provo',
          region: 'UT',
          postal_code: '84606',
          country: 'USA',
          started_at: 5.days.from_now.to_s(:db),
          ended_at: 8.days.from_now.to_s(:db),
          capalocality: 50,
          training_course_ids: ["","7"]
        }
      }
    }
    # must_redirect_to training_events_path
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
