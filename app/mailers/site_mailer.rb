class SiteMailer < ApplicationMailer
  def demo_request(demo_request)
    @demo_request = demo_request

    case @demo_request.country
    when condition

    end

    mail to:       %("Sales" <sales@wavetronix.com>),
         reply_to: %("#{@demo_request.name}" <#{@demo_request.email}>),
         subject:  'Demo Request'
  end

  def marketing_app_support_request(marketing_app_support_request)
    @marketing_app_support_request
    mail to:       %("Marketing Support" <marketing@wavetronix.com>),
         reply_to: %("#{@marketing_app_support_request.name}" <#{@marketing_app_support_request.email}>),
         subject:  "Marketing App Support Request"
  end
end
