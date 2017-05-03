require 'test_helper'

describe Admin::TrainingEventsController, :locale do
  let(:training_event) { training_events(:training_event) }

  describe "with authenticated user" do
    let(:user) { users(:generic_user) }

    before do
      sign_in user
    end

    describe "who is authorized" do
      before do
        user.add_role :training_event_manager
      end

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

    describe "who is not authorized" do
      it "prohibits index" do
        get admin_training_events_path
        must_redirect_to root_path
      end

      it "prohibits new" do
        get new_admin_training_event_path
        must_redirect_to root_path
      end

      it "won't create a training event" do
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
        }.wont_change 'TrainingEvent.count'
        must_redirect_to root_path
      end

      it "prohibits edit" do
        get edit_admin_training_event_path(training_event)
        must_redirect_to root_path
      end

      it "won't update a training event" do
        patch admin_training_event_path(training_event), params: {
          training_event: {
            title: training_event.title
          }
        }
        must_redirect_to root_path
      end

      it "won't destroy a training event" do
        -> {
          delete admin_training_event_path(training_event)
        }.wont_change 'TrainingEvent.count', -1
        must_redirect_to root_path
      end
    end
  end

  describe "without authenticated user" do
    it "prohibits index" do
      get admin_training_events_path
      must_redirect_to sign_in_path
    end

    it "prohibits new" do
      get new_admin_training_event_path
      must_redirect_to sign_in_path
    end

    it "won't create a training event" do
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
      }.wont_change 'TrainingEvent.count'
      must_redirect_to sign_in_path
    end

    it "prohibits edit" do
      get edit_admin_training_event_path(training_event)
      must_redirect_to sign_in_path
    end

    it "won't update a training event" do
      patch admin_training_event_path(training_event), params: {
        training_event: {
          title: training_event.title
        }
      }
      must_redirect_to sign_in_path
    end

    it "won't destroy a training event" do
      -> {
        delete admin_training_event_path(training_event)
      }.wont_change 'TrainingEvent.count', -1
      must_redirect_to sign_in_path
    end
  end
end
