require 'test_helper'

describe DemoRequestsController do
  let(:demo_request) { DemoRequest.new(name: 'Jack Ryan', email: 'jack.ryan@cia.gov', country: 'US') }

  it "sends an email" do
    -> {
      post demo_requests_path, params: {
        demo_request: {
          name: demo_request.name,
          email: demo_request.email,
          country: demo_request.country
        }
      }
    }
    # must_redirect_to referer URL
  end
end
