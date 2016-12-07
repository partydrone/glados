class SiteMailer < ApplicationMailer
  def demo_request(demo_request, referer)
    @demo_request  = demo_request
    @page          = referer
    @send_to_email = set_demo_request_recipient(@demo_request.country)

    mail to:    'webmaster@wavetronix.com', # send_to_email,
         reply_to: %("#{@demo_request.name}" <#{@demo_request.email}>),
         subject:  t('.subject')
  end

  def marketing_app_support_request(marketing_app_support_request)
    @marketing_app_support_request = marketing_app_support_request
    mail to:    'webmaster@wavetronix.com',
         reply_to: %("#{@marketing_app_support_request.name}" <#{@marketing_app_support_request.email}>),
         subject:  t('.subject')
  end

  private

  def set_demo_request_recipient(country)
    case @demo_request.country
    when 'HK', 'ID', 'IN', 'KR', 'MO', 'MY', 'SG', 'TH', 'TW'
      return 'apsales@wavetronix.com'
    when 'CN'
      return 'chinasales@wavetronix.com'
    when 'BY', 'CZ', 'FR'
      return 'eusales@wavetronix.com'
    when 'US'
      return 'nasales@wavetronix.com'
    when 'GB'
      return 'uksales@wavetronix.com'
    else
      return 'sales@wavetronix.com'
    end
  end
end
