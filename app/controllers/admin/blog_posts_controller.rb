module Admin
  class BlogPostsController < BaseController
    before_action :set_blog_post, only: [:show, :edit, :update, :destroy]

    def index
      @blog_posts = BlogPost.all
    end

    def show
    end

    def new
      @blog_post = BlogPost.new
    end

    def edit
    end

    def create
      @blog_post = BlogPost.new(blog_post_params)

      if @blog_post.save
        redirect_to @blog_post, notice: %(Saved "#{@blog_post.title}" successfully.)
      else
        render :new
      end
    end

    def update
      if @blog_post.update(blog_post_params)
        redirect_to @blog_post, notice: %(Updated "#{@blog_post.title}" successfully.)
      else
        render :edit
      end
    end

    def destroy
      @blog_post.destroy
      redirect_to admin_blog_posts_path, notice: %(Deleted "#{@blog_post.title}" successfully.)
    end

    private

    def set_blog_post
      @blog_post = BlogPost.find(params[:id])
    end

    def blog_post_params
      params.require(:blog_post).permit(:title, :subtitle, :author, :hero_image, :remove_hero_image, :body, :tag_list, :posted_on)
    end
  end
end
