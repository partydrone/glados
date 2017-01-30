require 'test_helper'


describe MarketingAppController, :locale do
  it "gets index" do
    get marketing_app_path
    must_respond_with :success
  end

  it "sends an email" do
    skip 'TODO: create email sent test'
  end
end
