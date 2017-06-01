require 'test_helper'

describe Admin::SalesTerritoriesController, :locale do
  let(:sales_territory) { sales_territories(:new_sales_territory) }

  describe "with authenticated user" do
    let(:user) { users(:generic_user) }

    before do
      sign_in user
    end

    describe "who is authorized" do
      before do
        user.add_role :sales_territory_manager
      end

      it "gets index" do
        get admin_sales_territories_path
        must_respond_with :success
      end

      it "gets new" do
        get new_admin_sales_territory_path
        must_respond_with :success
      end

      it "creates a sales territory" do
        -> {
          post admin_sales_territories_path, params: {
            sales_territory: {
              sales_region_id: sales_regions(:new_sales_region).id,
              name: 'Adobe Systems Incorporated',
              sales_office_id: sales_offices(:new_sales_office).id
            }
          }
        }.must_change 'SalesTerritory.count'
        flash[:notice].wont_be_nil
        must_redirect_to admin_sales_territories_path
      end

      # it "gets show" do
      #   get admin_sales_territory_path(sales_territory)
      #   must_respond_with :success
      # end

      it "gets edit" do
        get edit_admin_sales_territory_path(sales_territory)
        must_respond_with :success
      end

      it "updates a sales territory" do
        patch admin_sales_territory_path(sales_territory), params: {
          sales_territory: {
            name: sales_territory.name
          }
        }
        must_redirect_to admin_sales_territories_path
      end

      it "destroys a sales territory" do
        -> {
          delete admin_sales_territory_path(sales_territory)
        }.must_change 'SalesTerritory.count', -1
        must_redirect_to admin_sales_territories_path
      end
    end

    describe "who is not authorized" do
      it "prohibits index" do
        get admin_sales_territories_path
        must_redirect_to root_path
      end

      it "prohibits new" do
        get new_admin_sales_territory_path
        must_redirect_to root_path
      end

      it "won't create a sales territory" do
        -> {
          post admin_sales_territories_path, params: {
            sales_territory: {
              sales_region_id: sales_regions(:new_sales_region).id,
              name: 'Adobe Systems Incorporated',
              sales_office_id: sales_offices(:new_sales_office).id
            }
          }
        }.wont_change 'SalesTerritory.count'
        must_redirect_to root_path
      end

      # it "prohibits show" do
      #   get admin_sales_territory_path(sales_territory)
      #   must_redirect_to root_path
      # end

      it "prohibits edit" do
        get edit_admin_sales_territory_path(sales_territory)
        must_redirect_to root_path
      end

      it "won't update a sales territory" do
        patch admin_sales_territory_path(sales_territory), params: {
          sales_territory: {
            name: sales_territory.name
          }
        }
        must_redirect_to root_path
      end

      it "won't destroy a sales territory" do
        -> {
          delete admin_sales_territory_path(sales_territory)
        }.wont_change 'SalesTerritory.count', -1
        must_redirect_to root_path
      end
    end
  end

  describe "without authenticated user" do
    it "prohibits index" do
      get admin_sales_territories_path
      must_redirect_to sign_in_path
    end

    it "prohibits new" do
      get new_admin_sales_territory_path
      must_redirect_to sign_in_path
    end

    it "won't create a sales territory" do
      -> {
        post admin_sales_territories_path, params: {
          sales_territory: {
            name: 'Adobe Systems Incorporated',
            address: '345 Park Avenue',
            locality: 'San Jose',
            region: 'CA',
            postal_code: '95110-2704',
            country_id: 'US',
            phone: '(408) 536-6000',
            email: 'info@adobe.com',
            website: 'http://www.adobe.com'
          }
        }
      }.wont_change 'SalesTerritory.count'
      must_redirect_to sign_in_path
    end

    # it "prohibits show" do
    #   get admin_sales_territory_path(sales_territory)
    #   must_redirect_to sign_in_path
    # end

    it "prohibits edit" do
      get edit_admin_sales_territory_path(sales_territory)
      must_redirect_to sign_in_path
    end

    it "won't update a sales territory" do
      patch admin_sales_territory_path(sales_territory), params: {
        sales_territory: {
          name: sales_territory.name
        }
      }
      must_redirect_to sign_in_path
    end

    it "won't destroy a sales territory" do
      -> {
        delete admin_sales_territory_path(sales_territory)
      }.wont_change 'SalesTerritory.count', -1
      must_redirect_to sign_in_path
    end
  end
end
