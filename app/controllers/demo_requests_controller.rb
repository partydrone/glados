class DemoRequestsController < ApplicationController
  def create
    @demo_request = DemoRequest.new(demo_request_params)
    SiteMailer.demo_request(@demo_request).deliver_now
    redirect_back fallback_location: root_path, notice: 'We received your request.'
  end

  private

  def demo_request_params
    params.require(:demo_request).permit(:name, :email, :country)
  end
end
