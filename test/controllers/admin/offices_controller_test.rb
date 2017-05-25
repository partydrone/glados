require 'test_helper'

describe Admin::OfficesController, :locale do
  let(:office) { offices(:new_office) }

  describe "with authenticated user" do
    let(:user) { users(:generic_user) }

    before do
      sign_in user
    end

    describe "who is authorized" do
      before do
        user.add_role :office_manager
      end
      
      it "gets index" do
        get admin_offices_path
        must_respond_with :success
      end

      it "gets new" do
        get new_admin_office_path
        must_respond_with :success
      end

      it "creates a office" do
        -> {
          post admin_offices_path, params: {
            office: {
              name: 'NOAA',
              locality: 'Sitka'
            }
          }
        }.must_change 'Office.count'
        flash[:notice].wont_be_nil
        must_redirect_to admin_offices_path
      end

      it "gets show" do
        get admin_office_path(office)
        must_respond_with :success
      end

      it "gets edit" do
        get edit_admin_office_path(office)
        must_respond_with :success
      end

      it "updates a office" do
        patch admin_office_path(office), params: {
          office: {
            name: office.name
          }
        }
        must_redirect_to admin_office_path(office)
      end

      it "destroys a office" do
        -> {
          delete admin_office_path(office)
        }.must_change 'Office.count', -1
        must_redirect_to admin_offices_path
      end
    end

    describe "who is not authorized" do
      it "prohibits index" do
        get admin_offices_path
        must_redirect_to root_path
      end

      it "prohibits new" do
        get new_admin_office_path
        must_redirect_to root_path
      end

      it "won't create a office" do
        -> {
          post admin_offices_path, params: {
            office: {
              name: 'NOAA',
              locality: 'Sitka'
            }
          }
        }.wont_change 'Office.count'
        must_redirect_to root_path
      end

      it "prohibits show" do
        get admin_office_path(office)
        must_redirect_to root_path
      end

      it "prohibits edit" do
        get edit_admin_office_path(office)
        must_redirect_to root_path
      end

      it "won't update a office" do
        patch admin_office_path(office), params: {
          office: {
            name: office.name
          }
        }
        must_redirect_to root_path
      end

      it "won't destroy a office" do
        -> {
          delete admin_office_path(office)
        }.wont_change 'Office.count', -1
        must_redirect_to root_path
      end
    end
  end

  describe "without authenticated user" do
    it "prohibits index" do
      get admin_offices_path
      must_redirect_to sign_in_path
    end

    it "prohibits new" do
      get new_admin_office_path
      must_redirect_to sign_in_path
    end

    it "won't create a office" do
      -> {
        post admin_offices_path, params: {
          office: {
            name: 'NOAA',
            locality: 'Sitka'
          }
        }
      }.wont_change 'Office.count'
      must_redirect_to sign_in_path
    end

    it "prohibits show" do
      get admin_office_path(office)
      must_redirect_to sign_in_path
    end

    it "prohibits edit" do
      get edit_admin_office_path(office)
      must_redirect_to sign_in_path
    end

    it "won't update a office" do
      patch admin_office_path(office), params: {
        office: {
          name: office.name
        }
      }
      must_redirect_to sign_in_path
    end

    it "won't destroy a office" do
      -> {
        delete admin_office_path(office)
      }.wont_change 'Office.count', -1
      must_redirect_to sign_in_path
    end
  end
end
