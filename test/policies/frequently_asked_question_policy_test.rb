require 'test_helper'

class FrequentlyAskedQuestionPolicyTest < ActiveSupport::TestCase
  let(:frequently_asked_question) { frequently_asked_questions(:one) }
  let(:user) { users(:generic_user) }

  describe "for authorized user" do
    [:admin, :frequently_asked_question_manager].each do |role|
      before do
        user.add_role role
      end

      it "permits index" do
        :frequently_asked_question.must_permit user, :index
      end

      # it "permits show" do
      #   frequently_asked_question.must_permit user, :show
      # end

      it "permits new" do
        frequently_asked_question.must_permit user, :new
      end

      it "permits create" do
        frequently_asked_question.must_permit user, :create
      end

      it "permits edit" do
        frequently_asked_question.must_permit user, :edit
      end

      it "permits update" do
        frequently_asked_question.must_permit user, :update
      end

      it "permits destroy" do
        frequently_asked_question.must_permit user, :destroy
      end
    end
  end

  describe "for unauthorized user" do
    it "prohibits index" do
      :frequently_asked_question.wont_permit user, :index
    end

    # it "prohibits show" do
    #   frequently_asked_question.wont_permit user, :show
    # end

    it "prohibits new" do
      frequently_asked_question.wont_permit user, :new
    end

    it "prohibits create" do
      frequently_asked_question.wont_permit user, :create
    end

    it "prohibits edit" do
      frequently_asked_question.wont_permit user, :edit
    end

    it "prohibits update" do
      frequently_asked_question.wont_permit user, :update
    end

    it "prohibits destroy" do
      frequently_asked_question.wont_permit user, :destroy
    end
  end

  describe "for guest" do
    it "prohibits index" do
      :frequently_asked_question.wont_permit nil, :index
    end

    # it "prohibits show" do
    #   frequently_asked_question.wont_permit nil, :show
    # end

    it "prohibits new" do
      frequently_asked_question.wont_permit nil, :new
    end

    it "prohibits create" do
      frequently_asked_question.wont_permit nil, :create
    end

    it "prohibits edit" do
      frequently_asked_question.wont_permit nil, :edit
    end

    it "prohibits update" do
      frequently_asked_question.wont_permit nil, :update
    end

    it "prohibits destroy" do
      frequently_asked_question.wont_permit nil, :destroy
    end
  end
end
