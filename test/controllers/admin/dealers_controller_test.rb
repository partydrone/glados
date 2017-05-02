require 'test_helper'

describe Admin::DealersController, :locale do
  let(:dealer) { dealers(:new_dealer) }

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
          address: '123 fake street',
          city: 'Gravity Falls',
          region: 'Utah',
          zip: '84606',
          phone: '8016556556',
          email: 'bill@cipher.com',
          website: 'gravityfalls.com'
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
    must_respond_with :success    
  end

  it "destroys a dealer" do
    -> {
      delete admin_dealer_path(dealer)
    }.must_change 'Dealer.count', -1
    must_redirect_to admin_dealers_path
  end
end
