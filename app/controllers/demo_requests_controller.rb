class DemoRequestsController < ApplicationController
  def create
    @demo_request = DemoRequest.new(demo_request_params)

    if @demo_request.valid?
      SiteMailer.demo_request(@demo_request, request.referer).deliver_now
      redirect_back fallback_location: root_path, notice: t('ui.demo_request_sent')
    else
      redirect_back fallback_location: root_path, alert: t('ui.demo_request_error')
    end
  end

  private

  def demo_request_params
    params.require(:demo_request).permit(:name, :company, :email, :region, :country)
  end
end
