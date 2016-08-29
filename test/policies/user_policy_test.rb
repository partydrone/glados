# require 'test_helper'
#
# describe UserPolicy do
#   let(:user) { users(:generic_user) }
#
#   describe "for admin" do
#     let(:admin) { users(:admin) }
#
#     before do
#       admin.add_role :admin
#     end
#
#     it "permits index" do
#       :user.must_permit admin, :index
#     end
#
#     it "permits show" do
#       user.must_permit admin, :show
#     end
#
#     it "permits new" do
#       user.must_permit admin, :new
#     end
#
#     it "permits create" do
#       user.must_permit admin, :create
#     end
#
#     it "permits edit" do
#       user.must_permit admin, :edit
#     end
#
#     it "permits update" do
#       user.must_permit admin, :update
#     end
#
#     it "permits destroy" do
#       user.must_permit admin, :destroy
#     end
#   end
# end
