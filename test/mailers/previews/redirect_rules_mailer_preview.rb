# Preview all emails at http://localhost:3000/rails/mailers/redirect_rules_mailer
class RedirectRulesMailerPreview < ActionMailer::Preview
  def create
    RedirectRulesMailer.create(RedirectRule.first, User.first)
  end

  def update
    RedirectRulesMailer.update(RedirectRule.first, User.first)
  end

  def destroy
    RedirectRulesMailer.destroy(RedirectRule.first, User.first)
  end
end
