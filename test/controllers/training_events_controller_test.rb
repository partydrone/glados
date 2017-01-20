require 'test_helper'

describe TrainingEventsController, :locale do
  it "gets index" do
    get training_events_path
    must_respond_with :success
  end

  it "gets show" do
    get training_event_path(training_events(:training_event))
    must_respond_with :success
  end
end
