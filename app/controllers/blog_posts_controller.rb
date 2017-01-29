class BlogPostsController < ApplicationController
  def show
    @article = BlogPost.find(params[:id])
    @article.log_view unless browser.bot?
    # LogArticleViewJob.perform_later @article unless browser.bot?
    render 'articles/show'
  end
end
