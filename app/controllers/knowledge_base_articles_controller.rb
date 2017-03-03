class KnowledgeBaseArticlesController < ApplicationController
  def index
    @products = Product.joins(product_category: :product_type).knowledge_base_article_search(params[:query]).reorder('product_types.position, products.name')
  end

  def show
    @article = KnowledgeBaseArticle.find(params[:id])
    @article.log_view unless browser.bot?
    # LogArticleViewJob.perform_later @article unless browser.bot?
  end
end
