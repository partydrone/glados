module Admin
  class FrequentlyAskedQuestionsController < BaseController
    before_action :set_frequently_asked_question, only: [:edit, :update, :destroy]
    before_action :set_product_types, only: [:new, :edit]

    def index
      @frequently_asked_questions = FrequentlyAskedQuestion.all
      authorize @frequently_asked_questions
    end

    def new
      @frequently_asked_question = FrequentlyAskedQuestion.new
      authorize @frequently_asked_question
    end

    def edit
    end

    def create
      @frequently_asked_question = FrequentlyAskedQuestion.new(frequently_asked_question_params)
      authorize @frequently_asked_question

      if @frequently_asked_question.save
        redirect_to admin_frequently_asked_questions_path, notice: %(Saved "#{@frequently_asked_question.question}" successfully.)
      else
        set_product_types
        render :new
      end
    end

    def update
      if @frequently_asked_question.update(frequently_asked_question_params)
        redirect_to admin_frequently_asked_questions_path, notice: %(Updated "#{@frequently_asked_question.question} successfully.")
      else
        set_product_types
        render :edit
      end
    end

    def destroy
      @frequently_asked_question.destroy
      redirect_to admin_frequently_asked_questions_path, notice: %(Deleted "#{@frequently_asked_question.question} successfully.")
    end

    private

    def set_frequently_asked_question
      @frequently_asked_question = FrequentlyAskedQuestion.find(params[:id])
      authorize @frequently_asked_question
    end

    def frequently_asked_question_params
      params.require(:frequently_asked_question).permit(:question, :answer, :faq_topic_id, product_ids: [])
    end

    def set_product_types
      @product_types = ProductType.includes(:products).reorder(:position).order('products.name')
    end
  end
end
