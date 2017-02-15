class SiteMailer < ApplicationMailer
  def demo_request(demo_request, referer)
    @demo_request  = demo_request
    @page          = referer
    @send_to_email = set_demo_request_recipient(@demo_request.country)

    mail to:       @send_to_email,
         reply_to: %("#{@demo_request.name}" <#{@demo_request.email}>),
         subject:  t('.subject')
  end

  def marketing_app_support_request(marketing_app_support_request)
    @marketing_app_support_request = marketing_app_support_request
    mail to:    '"Marketing App Support" <appsupport@wavetronix.com>',
         reply_to: %("#{@marketing_app_support_request.name}" <#{@marketing_app_support_request.email}>),
         subject:  t('.subject')
  end

  def training_event_request(training_event_request, training_courses)
    @training_event_request = training_event_request
    @training_courses = training_courses
    mail to: '"Training" <jeremy.conterio@wavetronix.com>',
         reply_to: %("#{@training_event_request.company_name}" <#{@training_event_request.email}>),
         subject: t('.subject')         

  end

  private

  def set_demo_request_recipient(country)
    case @demo_request.country
    when 'HK', 'ID', 'IN', 'KR', 'MO', 'MY', 'SG', 'TH'
      return '"Asia Pacific Sales" <apsales@wavetronix.com>'
    when 'CN', 'TW'
      return '"China Sales" <chinasales@wavetronix.com>'
    when 'AE', 'BE', 'BY', 'CZ', 'ES', 'FR', 'GR', 'IT', 'KZ', 'KW', 'LU', 'PL', 'PT', 'QA', 'RU', 'SK', 'TR'
      return '"EU Sales" <eusales@wavetronix.com>'
    when 'GB', 'IE'
      return '"UK Sales" <uksales@wavetronix.com>'
    else
      return ['"Wavetronix Sales" <sales@wavetronix.com>', '"North America Sales" <nasales@wavetronix.com>', '"Georgia Sales" <gasales@wavetronix.com>', '"Tennessee Sales" <tnsales@wavetronix.com>']
    end
  end
end
