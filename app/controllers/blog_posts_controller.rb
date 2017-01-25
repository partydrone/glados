class BlogPostsController < ApplicationController
  def show
    @blog_post = BlogPost.find(params[:id])
    @blog_post.log_view unless browser.bot?
    # LogArticleViewJob.perform_later @blog_post unless browser.bot?
  end
end
