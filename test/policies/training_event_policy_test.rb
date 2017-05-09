require 'test_helper'

class TrainingEventPolicyTest < ActiveSupport::TestCase
  let(:training_event) { training_events(:training_event_one) }
  let(:user) { users(:generic_user) }

  describe "for authorized user" do
    [:admin, :training_event_manager].each do |role|
      before do
        user.add_role role
      end

      it "permits index" do
        :training_event.must_permit user, :index
      end

      it "permits show" do
        training_event.must_permit user, :show
      end

      it "permits new" do
        training_event.must_permit user, :new
      end

      it "permits create" do
        training_event.must_permit user, :create
      end

      it "permits edit" do
        training_event.must_permit user, :edit
      end

      it "permits update" do
        training_event.must_permit user, :update
      end

      it "permits destroy" do
        training_event.must_permit user, :destroy
      end
    end
  end

  describe "for unauthorized user" do
    it "prohibits index" do
      :training_event.wont_permit user, :index
    end

    it "prohibits show" do
      training_event.wont_permit user, :show
    end

    it "prohibits new" do
      training_event.wont_permit user, :new
    end

    it "prohibits create" do
      training_event.wont_permit user, :create
    end

    it "prohibits edit" do
      training_event.wont_permit user, :edit
    end

    it "prohibits update" do
      training_event.wont_permit user, :update
    end

    it "prohibits destroy" do
      training_event.wont_permit user, :destroy
    end
  end

  describe "for guest" do
    it "prohibits index" do
      :training_event.wont_permit nil, :index
    end

    it "prohibits show" do
      training_event.wont_permit nil, :show
    end

    it "prohibits new" do
      training_event.wont_permit nil, :new
    end

    it "prohibits create" do
      training_event.wont_permit nil, :create
    end

    it "prohibits edit" do
      training_event.wont_permit nil, :edit
    end

    it "prohibits update" do
      training_event.wont_permit nil, :update
    end

    it "prohibits destroy" do
      training_event.wont_permit nil, :destroy
    end
  end
end
