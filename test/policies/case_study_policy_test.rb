require 'test_helper'

class CaseStudyPolicyTest < ActiveSupport::TestCase
  let(:case_study) { case_studies(:new_case_study) }
  let(:user) { users(:generic_user) }

  describe "for authorized user" do
    [:admin, :case_study_manager].each do |role|
      before do
        user.add_role role
      end

      it "permits index" do
        :case_study.must_permit user, :index
      end

      it "permits show" do
        case_study.must_permit user, :show
      end

      it "permits new" do
        case_study.must_permit user, :new
      end

      it "permits create" do
        case_study.must_permit user, :create
      end

      it "permits edit" do
        case_study.must_permit user, :edit
      end

      it "permits update" do
        case_study.must_permit user, :update
      end

      it "permits destroy" do
        case_study.must_permit user, :destroy
      end
    end
  end

  describe "for unauthorized user" do
    it "prohibits index" do
      :case_study.wont_permit user, :index
    end

    it "prohibits show" do
      case_study.wont_permit user, :show
    end

    it "prohibits new" do
      case_study.wont_permit user, :new
    end

    it "prohibits create" do
      case_study.wont_permit user, :create
    end

    it "prohibits edit" do
      case_study.wont_permit user, :edit
    end

    it "prohibits update" do
      case_study.wont_permit user, :update
    end

    it "prohibits destroy" do
      case_study.wont_permit user, :destroy
    end
  end

  describe "for guest" do
    it "prohibits index" do
      :case_study.wont_permit nil, :index
    end

    it "prohibits show" do
      case_study.wont_permit nil, :show
    end

    it "prohibits new" do
      case_study.wont_permit nil, :new
    end

    it "prohibits create" do
      case_study.wont_permit nil, :create
    end

    it "prohibits edit" do
      case_study.wont_permit nil, :edit
    end

    it "prohibits update" do
      case_study.wont_permit nil, :update
    end

    it "prohibits destroy" do
      case_study.wont_permit nil, :destroy
    end
  end
end
