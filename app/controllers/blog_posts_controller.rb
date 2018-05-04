class BlogPostsController < ApplicationController
  def show
    @article = Article.find(params[:id])
    # @article.log_view unless browser.bot?
    # LogArticleViewJob.perform_later @article unless browser.bot?
    @related_articles = @article.find_related_tags.limit(3)
    render 'articles/show'
  end
end
