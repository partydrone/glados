class KnowledgeBaseArticlesController < ApplicationController
  def index
    @products = Product.knowledge_base_article_search(params[:query])
  end

  def show
    @article = KnowledgeBaseArticle.find(params[:id])
    @article.log_view unless browser.bot?
    # LogArticleViewJob.perform_later @article unless browser.bot?
  end
end
