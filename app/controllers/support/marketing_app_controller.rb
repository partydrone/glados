module Support
  class MarketingAppController < BaseController
    def index
    end
    def send_app_support_email
    	name = params[:app_support_name]
    	email = params[:app_support_email]
    	desc = params[:app_support_description]
    	MarketingAppMailer.send_app_support_email(name, email, desc).deliver
    	redirect_to support_marketing_app_path, notice: 'Request sent!'
    end
  end
end
