class KnowledgeBaseArticlesController < ApplicationController
  def index
    @products = Product.includes(:articles).where(articles: {type: 'KnowledgeBaseArticle'})
  end

  def show
    @article = KnowledgeBaseArticle.find(params[:id])
    @article.log_view unless browser.bot?
    # LogArticleViewJob.perform_later @article unless browser.bot?
  end
end
