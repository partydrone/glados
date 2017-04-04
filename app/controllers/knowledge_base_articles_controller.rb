class KnowledgeBaseArticlesController < ApplicationController
  before_action :set_knowledge_base_article, only: [:show, :vote]

  def index
    @products = Product.knowledge_base_article_search(params[:query])
  end

  def show
    @article.log_view unless browser.bot?
    # LogArticleViewJob.perform_later @article unless browser.bot?
  end

  def vote
    cookies.permanent["kb_article_#{@article.id}_vote"] = @article.digest
  end

  private

  def set_knowledge_base_article
    @article = KnowledgeBaseArticle.find(params[:id])
  end
end
