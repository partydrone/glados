require 'test_helper'

describe TrainingEventRequestsController, :locale do
  it "should get new" do
    get new_training_event_request_url
    assert_response :success
  end

end