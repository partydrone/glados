# Preview all emails at http://localhost:3000/rails/mailers/site_mailer
class SiteMailerPreview < ActionMailer::Preview
  def knowledge_base_article_feedback
    SiteMailer.knowledge_base_article_feedback(KnowledgeBaseArticle.first, 'This is my feedback.')
  end
end
