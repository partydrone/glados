module Support
  class MarketingAppController < BaseController
    def index
      @marketing_app_support_request = MarketingAppSupportRequest.new
    end
  end
end
