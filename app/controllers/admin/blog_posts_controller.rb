module Admin
  class BlogPostsController < BaseController
    before_action :set_blog_post, only: [:show, :edit, :update, :destroy]
    before_action :set_taggable_items, only: [:new, :edit]

    def index
      @blog_posts = BlogPost.all
      authorize @blog_posts
    end

    def show
      @article = @blog_post
    end

    def new
      @blog_post = BlogPost.new
      authorize @blog_post
    end

    def edit
    end

    def create
      @blog_post = BlogPost.new(blog_post_params)
      authorize @blog_post

      if @blog_post.save
        redirect_to [:admin,@blog_post], notice: %(Saved "#{@blog_post.title}" successfully.)
      else
        render :new
      end
    end

    def update
      if @blog_post.update(blog_post_params)
        redirect_to [:admin,@blog_post], notice: %(Updated "#{@blog_post.title}" successfully.)
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
      authorize @blog_post
    end

    def blog_post_params
      params.require(:blog_post).permit(:title, :subtitle, :author, :hero_image, :body, :posted_on, :tag_list)
    end

    def set_taggable_items
      @taggable_items = Tag.pluck(:name)
    end

  end
end
