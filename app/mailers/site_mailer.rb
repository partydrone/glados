class SiteMailer < ApplicationMailer
  def demo_request(demo_request)
    @demo_request = demo_request
    mail to: %("Sales" <partydrone@gmail.com>),
         reply_to: %("#{@demo_request.name}" <#{@demo_request.email}>),
         subject: 'Demo Request'
  end
end
