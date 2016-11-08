class MarketingAppMailer < ActionMailer::Base
  default from: "webmaster@wavetronix.com.com"  

  def send_app_support_email(name, email, desc)
  	@name = name
	@email = email
	@desc = desc
    mail(:to => "ehuntsman@wavetronix.com", :subject => "Marketing App Support Request")
  end
end 