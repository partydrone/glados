class KnowledgeBaseArticleFeedbacksController < ApplicationController
  def create
    @knowledge_base_article_feedback = KnowledgeBaseArticleFeedback.new(knowledge_base_article_feedback_params)
    @knowledge_base_article          = KnowledgeBaseArticle.find(@knowledge_base_article_feedback.article_id)

    if @knowledge_base_article_feedback.valid?
      SiteMailer.knowledge_base_article_feedback(@knowledge_base_article, @knowledge_base_article_feedback).deliver_now
      cookies.permanent["kb_article_#{@knowledge_base_article.id}_vote"] = @knowledge_base_article.digest
      redirect_back fallback_location: root_path, notice: t('ui.knowledge_base_article_feedback_sent')
    else
      redirect_back fallback_location: root_path, alert: t('ui.knowledge_base_article_feedback_error')
    end
  end

  private

  def knowledge_base_article_feedback_params
    params.require(:knowledge_base_article_feedback).permit(:message, :article_id)
  end
end
