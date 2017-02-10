module Admin
  class KnowledgeBaseArticlesController < BaseController
    before_action :set_knowledge_base_article, only: [:show, :edit, :update, :destroy]

    def index
      @knowledge_base_articles = KnowledgeBaseArticle.all
    end

    def show
      @article = @knowledge_base_article
      render 'articles/show'
    end

    def new
      @knowledge_base_article = KnowledgeBaseArticle.new
    end

    def edit
    end

    def create
      @knowledge_base_article = KnowledgeBaseArticle.new(knowledge_base_article_params)

      if @knowledge_base_article.save
        redirect_to [:admin,@knowledge_base_article], notice: %(Saved "#{@knowledge_base_article.title}" successfully.)
      else
        render :new
      end
    end

    def update
      if @knowledge_base_article.update(knowledge_base_article_params)
        redirect_to [:admin,@knowledge_base_article], notice: %(Updated "#{@knowledge_base_article.title}" successfully.)
      else
        render :edit
      end
    end

    def destroy
      @knowledge_base_article.destroy
      redirect_to admin_knowledge_base_articles_path, notice: %(Deleted "#{@knowledge_base_article.title}" successfully.)
    end

    private

    def set_knowledge_base_article
      @knowledge_base_article = KnowledgeBaseArticle.find(params[:id])
    end

    def knowledge_base_article_params
      params.require(:knowledge_base_article).permit(:title, :body, :posted_on, :tag_list)
    end
  end
end
