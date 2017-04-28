require 'test_helper'

describe UserPolicy do
  let(:user) { User.create(first_name: 'Thomas', last_name: 'Jefferson', email: 'thomas.jefferson@whitehouse.gov', uid: '123456789012', provider: 'identity') }

  describe "for admin" do
    let(:admin) { User.create(first_name: 'George', last_name: 'Washington', email: 'george.washington@whitehouse.gov', uid: '123456789098', provider: 'identity') }

    before do
      admin.add_role :admin
    end

    it "permits index" do
      :user.must_permit admin, :index
    end

    it "permits show" do
      user.must_permit admin, :show
    end

    it "permits new" do
      user.must_permit admin, :new
    end

    it "permits create" do
      user.must_permit admin, :create
    end

    it "permits edit" do
      user.must_permit admin, :edit
    end

    it "permits update" do
      user.must_permit admin, :update
    end

    it "permits destroy" do
      user.must_permit admin, :destroy
    end
  end

  describe "for unauthorized user" do
    it "prohibits index" do
      :user.wont_permit user, :index
    end

    it "permits show" do
      user.must_permit user, :show
    end

    it "prohibits new" do
      user.wont_permit user, :new
    end

    it "prohibits create" do
      user.wont_permit user, :create
    end

    it "prohibits edit" do
      user.wont_permit user, :edit
    end

    it "prohibits update" do
      user.wont_permit user, :update
    end

    it "prohibits destroy" do
      user.wont_permit user, :destroy
    end
  end
end
