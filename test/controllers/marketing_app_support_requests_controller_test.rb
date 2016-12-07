require 'test_helper'

describe MarketingAppSupportRequestsController do
  let(:marketing_app_support_request) { MarketingAppSupportRequest.new(name: 'Bono', email: 'bono@u2.com', description: "I still haven't found what I'm looking for.") }

  it "sends an email" do
    -> {
      post marketing_app_support_requests_path, params: {
        marketing_app_support_request: {
          name: marketing_app_support_request.name,
          email: marketing_app_support_request.email,
          description: marketing_app_support_request.description
        }
      }
    }
    # must_redirect_to referer URL
  end
end
