class SiteMailer < ApplicationMailer
  def demo_request(demo_request)
    @demo_request = demo_request
    @page = request.path

    case @demo_request.country
    when 'HK', 'ID', 'IN', 'KR', 'MO', 'MY', 'SG', 'TH', 'TW'
      @send_to_email = 'apsales@wavetronix.com'
    when 'CN'
      @send_to_email = 'chinasales@wavetronix.com'
    when 'BY', 'CZ', 'FR'
      @send_to_email = 'eusales@wavetronix.com'
    when 'US'
      @send_to_email = 'nasales@wavetronix.com'
    when 'GB'
      @send_to_email = 'uksales@wavetronix.com'
    else
      @send_to_email = 'sales@wavetronix.com'
    end

    mail to:       'webmaster@wavetronix.com', # send_to_email,
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
