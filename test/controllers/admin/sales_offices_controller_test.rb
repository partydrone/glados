require 'test_helper'

describe Admin::SalesOfficesController, :locale do
  let(:sales_office) { sales_offices(:new_sales_office) }

  describe "with authenticated user" do
    let(:user) { users(:generic_user) }

    before do
      sign_in user
    end

    describe "who is authorized" do
      before do
        user.add_role :sales_office_manager
      end

      it "gets index" do
        get admin_sales_offices_path
        must_respond_with :success
      end

      it "gets new" do
        get new_admin_sales_office_path
        must_respond_with :success
      end

      it "creates a office" do
        -> {
          post admin_sales_offices_path, params: {
            sales_office: {
              name: 'NOAA',
              locality: 'Sitka'
            }
          }
        }.must_change 'SalesOffice.count'
        flash[:notice].wont_be_nil
        must_redirect_to admin_sales_offices_path
      end

      it "gets show" do
        get admin_sales_office_path(sales_office)
        must_respond_with :success
      end

      it "gets edit" do
        get edit_admin_sales_office_path(sales_office)
        must_respond_with :success
      end

      it "updates a office" do
        patch admin_sales_office_path(sales_office), params: {
          sales_office: {
            name: sales_office.name
          }
        }
        must_redirect_to admin_sales_office_path(sales_office)
      end

      it "destroys a office" do
        -> {
          delete admin_sales_office_path(sales_office)
        }.must_change 'SalesOffice.count', -1
        must_redirect_to admin_sales_offices_path
      end
    end

    describe "who is not authorized" do
      it "prohibits index" do
        get admin_sales_offices_path
        must_redirect_to root_path
      end

      it "prohibits new" do
        get new_admin_sales_office_path
        must_redirect_to root_path
      end

      it "won't create a office" do
        -> {
          post admin_sales_offices_path, params: {
            sales_office: {
              name: 'NOAA',
              locality: 'Sitka'
            }
          }
        }.wont_change 'SalesOffice.count'
        must_redirect_to root_path
      end

      it "prohibits show" do
        get admin_sales_office_path(sales_office)
        must_redirect_to root_path
      end

      it "prohibits edit" do
        get edit_admin_sales_office_path(sales_office)
        must_redirect_to root_path
      end

      it "won't update a office" do
        patch admin_sales_office_path(sales_office), params: {
          sales_office: {
            name: sales_office.name
          }
        }
        must_redirect_to root_path
      end

      it "won't destroy a office" do
        -> {
          delete admin_sales_office_path(sales_office)
        }.wont_change 'SalesOffice.count', -1
        must_redirect_to root_path
      end
    end
  end

  describe "without authenticated user" do
    it "prohibits index" do
      get admin_sales_offices_path
      must_redirect_to sign_in_path
    end

    it "prohibits new" do
      get new_admin_sales_office_path
      must_redirect_to sign_in_path
    end

    it "won't create a office" do
      -> {
        post admin_sales_offices_path, params: {
          sales_office: {
            name: 'NOAA',
            locality: 'Sitka'
          }
        }
      }.wont_change 'SalesOffice.count'
      must_redirect_to sign_in_path
    end

    it "prohibits show" do
      get admin_sales_office_path(sales_office)
      must_redirect_to sign_in_path
    end

    it "prohibits edit" do
      get edit_admin_sales_office_path(sales_office)
      must_redirect_to sign_in_path
    end

    it "won't update a office" do
      patch admin_sales_office_path(sales_office), params: {
        sales_office: {
          name: sales_office.name
        }
      }
      must_redirect_to sign_in_path
    end

    it "won't destroy a office" do
      -> {
        delete admin_sales_office_path(sales_office)
      }.wont_change 'SalesOffice.count', -1
      must_redirect_to sign_in_path
    end
  end
end
