class MarketingAppSupportRequestsController < ApplicationController
  def create
    @marketing_app_support_request = MarketingAppSupportRequest.new(marketing_app_support_request_params)
    if @marketing_app_support_request.valid?
      SiteMailer.marketing_app_support_request(@marketing_app_support_request).deliver_now
      redirect_back fallback_location: root_path, notice: t('ui.marketing_app_support_request_sent')
    else
      redirect_back fallback_location: root_path, alert: t('ui.marketing_app_support_request_error')
    end
  end

  private

  def marketing_app_support_request_params
    params.require(:marketing_app_support_request).permit(:name, :email, :description)
  end
end
