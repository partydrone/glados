require 'test_helper'

describe Admin::DealersController, :locale do
  let(:dealer) { dealers(:new_dealer) }

  describe "with authenticated user" do
    let(:user) { users(:generic_user) }

    before do
      sign_in user
    end

    describe "who is authorized" do
      before do
        user.add_role :dealer_manager
      end

      it "gets index" do
        get admin_dealers_path
        must_respond_with :success
      end

      it "gets new" do
        get new_admin_dealer_path
        must_respond_with :success
      end

      it "creates a dealer" do
        -> {
          post admin_dealers_path, params: {
            dealer: {
              name: 'Bill Cipher',
              city: 'Gravity Falls'
            }
          }
        }.must_change 'Dealer.count'
        flash[:notice].wont_be_nil
        must_redirect_to admin_dealers_path
      end

      it "gets show" do
        get admin_dealer_path(dealer)
        must_respond_with :success
      end

      it "gets edit" do
        get edit_admin_dealer_path(dealer)
        must_respond_with :success
      end

      it "updates a dealer" do
        patch admin_dealer_path(dealer), params: {
          dealer: {
            name: dealer.name
          }
        }
        must_redirect_to admin_dealer_path(dealer)
      end

      it "destroys a dealer" do
        -> {
          delete admin_dealer_path(dealer)
        }.must_change 'Dealer.count', -1
        must_redirect_to admin_dealers_path
      end
    end

    describe "who is not authorized" do
      it "prohibits index" do
        get admin_dealers_path
        must_redirect_to root_path
      end

      it "prohibits new" do
        get new_admin_dealer_path
        must_redirect_to root_path
      end

      it "won't create a dealer" do
        -> {
          post admin_dealers_path, params: {
            dealer: {
              name: 'Bill Cipher',
              city: 'Gravity Falls'
            }
          }
        }.wont_change 'Dealer.count'
        must_redirect_to root_path
      end

      it "prohibits show" do
        get admin_dealer_path(dealer)
        must_redirect_to root_path
      end

      it "prohibits edit" do
        get edit_admin_dealer_path(dealer)
        must_redirect_to root_path
      end

      it "won't update a dealer" do
        patch admin_dealer_path(dealer), params: {
          dealer: {
            name: dealer.name
          }
        }
        must_redirect_to root_path
      end

      it "won't destroy a dealer" do
        -> {
          delete admin_dealer_path(dealer)
        }.wont_change 'Dealer.count', -1
        must_redirect_to root_path
      end
    end
  end

  describe "without authenicated user" do
    it "prohibits index" do
      get admin_dealers_path
      must_redirect_to sign_in_path
    end

    it "prohibits new" do
      get new_admin_dealer_path
      must_redirect_to sign_in_path
    end

    it "won't create a dealer" do
      -> {
        post admin_dealers_path, params: {
          dealer: {
            name: 'Bill Cipher',
            city: 'Gravity Falls'
          }
        }
      }.wont_change 'Dealer.count'
      must_redirect_to sign_in_path
    end

    it "prohibits show" do
      get admin_dealer_path(dealer)
      must_redirect_to sign_in_path
    end

    it "prohibits edit" do
      get edit_admin_dealer_path(dealer)
      must_redirect_to sign_in_path
    end

    it "won't update a dealer" do
      patch admin_dealer_path(dealer), params: {
        dealer: {
          name: dealer.name
        }
      }
      must_redirect_to sign_in_path
    end

    it "won't destroy a dealer" do
      -> {
        delete admin_dealer_path(dealer)
      }.wont_change 'Dealer.count', -1
      must_redirect_to sign_in_path
    end
  end
end
