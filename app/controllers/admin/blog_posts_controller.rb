module Admin
  class BlogPostsController < BaseController
    before_action :set_blog_post, only: [:show, :edit, :update, :destroy]
    before_action :set_taggable_items, only: [:new, :edit]

    def index
      @blog_posts = BlogPost.order(updated_at: :desc)
      authorize @blog_posts
    end

    def show
      @article = @blog_post
      @translation_locale = params[:translation_locale] || I18n.locale

      respond_to do |format|
        format.html
        format.json
      end
    end

    def new
      @blog_post = BlogPost.new
      authorize @blog_post
    end

    def edit
    end

    def create
      Mobility.with_locale(params[:translation_locale]) do
        @blog_post = BlogPost.new(blog_post_params)
        authorize @blog_post

        if @blog_post.save
          redirect_to [:admin,@blog_post], notice: %(Saved "#{@blog_post.title}" successfully.)
        else
          render :new
        end
      end
    end

    def update
      Mobility.with_locale(params[:translation_locale]) do
        if @blog_post.update(blog_post_params)
          redirect_to [:admin,@blog_post], notice: %(Updated "#{@blog_post.title}" successfully.)
        else
          render :edit
        end
      end
    end

    def destroy
      translation_locale = params[:translation_locale]

      if translation_locale
        if @blog_post.translations.count > 1
          Mobility.with_locale(translation_locale) do
            @blog_post.translation.destroy
            message = %(Deleted #{helpers.humanize_locale translation_locale} translation successfully.)
          end
        else
          message = %(#{helpers.humanize_locale translation_locale} is the only translation left and cannot be deleted. Delete the record, instead.)
        end
      else
        @blog_post.destroy
        message = %(Deleted "#{@blog_post.title}" successfully.)
      end

      redirect_to admin_blog_posts_path, notice: message
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
