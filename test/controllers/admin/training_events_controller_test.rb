require 'test_helper'

describe Admin::TrainingEventsController, :locale do
  let(:training_event) { training_events(:training_event) }

  it "gets index" do
    get admin_training_events_path
    must_respond_with :success
  end

  it "gets new" do
    get new_admin_training_event_path
    must_respond_with :success
  end

  it "creates a training event" do
    -> {
      post admin_training_events_path, params: {
        training_event: {
          title: 'Educational Event',
          description: 'Learn new things!',
          started_at: 2.days.from_now.to_s(:db),
          ended_at: 3.days.from_now.to_s(:db),
          location: 'Provo, Utah'
        }
      }
    }.must_change 'TrainingEvent.count'
    flash[:notice].wont_be_nil
    must_redirect_to admin_training_events_path
  end

  it "gets edit" do
    get edit_admin_training_event_path(training_event)
    must_respond_with :success
  end

  it "updates a training event" do
    patch admin_training_event_path(training_event), params: {
      training_event: {
        title: training_event.title
      }
    }
    must_redirect_to admin_training_events_path
  end

  it "destroys a training event" do
    -> {
      delete admin_training_event_path(training_event)
    }.must_change 'TrainingEvent.count', -1
    must_redirect_to admin_training_events_path
  end
end
