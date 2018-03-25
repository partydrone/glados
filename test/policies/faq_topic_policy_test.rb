require 'test_helper'

class FaqTopicPolicyTest < ActiveSupport::TestCase
  let(:faq_topic) { faq_topics(:one) }
  let(:user) { users(:generic_user) }

  describe "for authorized user" do
    [:admin, :faq_topic_manager].each do |role|
      before do
        user.add_role role
      end

      it "permits index" do
        :faq_topic.must_permit user, :index
      end

      # it "permits show" do
      #   faq_topic.must_permit user, :show
      # end

      it "permits new" do
        faq_topic.must_permit user, :new
      end

      it "permits create" do
        faq_topic.must_permit user, :create
      end

      it "permits edit" do
        faq_topic.must_permit user, :edit
      end

      it "permits update" do
        faq_topic.must_permit user, :update
      end

      it "permits destroy" do
        faq_topic.must_permit user, :destroy
      end
    end
  end

  describe "for unauthorized user" do
    it "prohibits index" do
      :faq_topic.wont_permit user, :index
    end

    # it "prohibits show" do
    #   faq_topic.wont_permit user, :show
    # end

    it "prohibits new" do
      faq_topic.wont_permit user, :new
    end

    it "prohibits create" do
      faq_topic.wont_permit user, :create
    end

    it "prohibits edit" do
      faq_topic.wont_permit user, :edit
    end

    it "prohibits update" do
      faq_topic.wont_permit user, :update
    end

    it "prohibits destroy" do
      faq_topic.wont_permit user, :destroy
    end
  end

  describe "for guest" do
    it "prohibits index" do
      :faq_topic.wont_permit nil, :index
    end

    # it "prohibits show" do
    #   faq_topic.wont_permit nil, :show
    # end

    it "prohibits new" do
      faq_topic.wont_permit nil, :new
    end

    it "prohibits create" do
      faq_topic.wont_permit nil, :create
    end

    it "prohibits edit" do
      faq_topic.wont_permit nil, :edit
    end

    it "prohibits update" do
      faq_topic.wont_permit nil, :update
    end

    it "prohibits destroy" do
      faq_topic.wont_permit nil, :destroy
    end
  end
end
