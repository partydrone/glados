require 'test_helper'

describe Admin::SalesRegionsController, :locale do
  let(:sales_region) { sales_regions(:new_sales_region) }

  describe "with authenticated user" do
    let(:user) { users(:generic_user) }

    before do
      sign_in user
    end

    describe "who is authorized" do
      before do
        user.add_role :sales_region_manager
      end

      it "gets index" do
        get admin_sales_regions_path
        must_respond_with :success
      end

      it "gets new" do
        get new_admin_sales_region_path
        must_respond_with :success
      end

      it "creates a download type" do
        -> {
          post admin_sales_regions_path, params: {
            sales_region: {
              name: 'System One',
              position: '4'
            }
          }
        }.must_change 'SalesRegion.count'
        flash[:notice].wont_be_nil
        must_redirect_to admin_sales_regions_path
      end

      # it "gets show" do
      #   get admin_sales_region_path(sales_region)
      #   must_respond_with :success
      # end

      it "gets edit" do
        get edit_admin_sales_region_path(sales_region)
        must_respond_with :success
      end

      it "updates a download type" do
        patch admin_sales_region_path(sales_region), params: {
          sales_region: {
            name: sales_region.name
          }
        }
        must_redirect_to admin_sales_regions_path
      end

      it "destroys a download type" do
        -> {
          delete admin_sales_region_path(sales_region)
        }.must_change 'SalesRegion.count', -1
        must_redirect_to admin_sales_regions_path
      end
    end

    describe "who is not authorized" do
      it "prohibits index" do
        get admin_sales_regions_path
        must_redirect_to root_path
      end

      it "prohibits new" do
        get new_admin_sales_region_path
        must_redirect_to root_path
      end

      it "won't create a download type" do
        -> {
          post admin_sales_regions_path, params: {
            sales_region: {
              name: 'System One',
              position: '4'
            }
          }
        }.wont_change 'SalesRegion.count'
        must_redirect_to root_path
      end

      # it "prohibits show" do
      #   get admin_sales_region_path(sales_region)
      #   must_redirect_to root_path
      # end

      it "prohibits edit" do
        get edit_admin_sales_region_path(sales_region)
        must_redirect_to root_path
      end

      it "won't update a download type" do
        patch admin_sales_region_path(sales_region), params: {
          sales_region: {
            name: sales_region.name
          }
        }
        must_redirect_to root_path
      end

      it "won't destroy a download type" do
        -> {
          delete admin_sales_region_path(sales_region)
        }.wont_change 'SalesRegion.count', -1
        must_redirect_to root_path
      end
    end
  end

  describe "without authenicated user" do
    it "prohibits index" do
      get admin_sales_regions_path
      must_redirect_to sign_in_path
    end

    it "prohibits new" do
      get new_admin_sales_region_path
      must_redirect_to sign_in_path
    end

    it "won't create a download type" do
      -> {
        post admin_sales_regions_path, params: {
          sales_region: {
            name: 'System One',
            position: '4'
          }
        }
      }.wont_change 'SalesRegion.count'
      must_redirect_to sign_in_path
    end

    # it "prohibits show" do
    #   get admin_sales_region_path(sales_region)
    #   must_redirect_to sign_in_path
    # end

    it "prohibits edit" do
      get edit_admin_sales_region_path(sales_region)
      must_redirect_to sign_in_path
    end

    it "won't update a download type" do
      patch admin_sales_region_path(sales_region), params: {
        sales_region: {
          name: sales_region.name
        }
      }
      must_redirect_to sign_in_path
    end

    it "won't destroy a download type" do
      -> {
        delete admin_sales_region_path(sales_region)
      }.wont_change 'SalesRegion.count', -1
      must_redirect_to sign_in_path
    end
  end
end
