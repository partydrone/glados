require 'test_helper'

module Support
  describe MarketingAppController, :locale do
    it "gets index" do
      get support_marketing_app_path
      must_respond_with :success
    end

    it "sends an email" do
      skip 'TODO: create email sent test'
    end
  end
end
