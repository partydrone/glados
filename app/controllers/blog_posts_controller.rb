class BlogPostsController < ApplicationController
  def show
    @blog_post = BlogPost.find(params[:id])
  end
end
