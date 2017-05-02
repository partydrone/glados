require 'test_helper'

describe RolePolicy do
  let(:role) { Role.create!(name: 'supervisor') }

  describe "for admin" do
    let(:admin) { User.create(first_name: 'George', last_name: 'Washington', email: 'george.washington@whitehouse.gov', uid: '123456789098', provider: 'identity') }

    before do
      admin.add_role :admin
    end

    it "permits index" do
      :role.must_permit admin, :index
    end

    # it "permits show" do
    #   role.must_permit admin, :show
    # end

    it "permits new" do
      role.must_permit admin, :new
    end

    it "permits create" do
      role.must_permit admin, :create
    end

    it "permits edit" do
      role.must_permit admin, :edit
    end

    it "permits update" do
      role.must_permit admin, :update
    end

    it "permits destroy" do
      role.must_permit admin, :destroy
    end
  end

  describe "for unauthorized user" do
    let(:user) { User.create(first_name: 'James', last_name: 'Madison', email: 'james.madison@whitehouse.gov', uid: '123456789012', provider: 'identity') }

    it "prohibits index" do
      :role.wont_permit user, :index
    end

    # it "prohibits show" do
    #   role.wont_permit user, :show
    # end

    it "prohibits new" do
      role.wont_permit user, :new
    end

    it "prohibits create" do
      role.wont_permit user, :create
    end

    it "prohibits edit" do
      role.wont_permit user, :edit
    end

    it "prohibits update" do
      role.wont_permit user, :update
    end

    it "prohibits destroy" do
      role.wont_permit user, :destroy
    end
  end
end
