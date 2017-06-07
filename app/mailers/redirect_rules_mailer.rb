class RedirectRulesMailer < ApplicationMailer
  def create(redirect_rule, user)
    @redirect_rule = redirect_rule
    @user = user
    mail to: 'webmaster@wavetronix.com'
  end

  def update(redirect_rule, user)
    @redirect_rule = redirect_rule
    @user = user
    mail to: 'webmaster@wavetronix.com'
  end

  def destroy(redirect_rule, user)
    @redirect_rule = redirect_rule
    @user = user
    mail to: 'webmaster@wavetronix.com'
  end
end
