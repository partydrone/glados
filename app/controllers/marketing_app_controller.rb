class MarketingAppController < ApplicationController
  def index
    @marketing_app_support_request = MarketingAppSupportRequest.new
  end
end
