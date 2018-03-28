module Admin
  class FaqTopicsController < BaseController
    before_action :set_faq_topic, only: [:edit, :update, :destroy]

    def index
      @faq_topics = FaqTopic.order(:title)
      authorize @faq_topics
    end

    def new
      @faq_topic = FaqTopic.new
      authorize @faq_topic
    end

    def edit
    end

    def create
      @faq_topic = FaqTopic.new(faq_topic_params)
      authorize @faq_topic

      if @faq_topic.save
        redirect_to admin_faq_topics_path, notice: %(Saved "#{@faq_topic.title}" successfully.)
      else
        render :new
      end
    end

    def update
      if @faq_topic.update(faq_topic_params)
        redirect_to admin_faq_topics_path, notice: %(Updated "#{@faq_topic.title} successfully.")
      else
        render :edit
      end
    end

    def destroy
      @faq_topic.destroy
      redirect_to admin_faq_topics_path, notice: %(Deleted "#{@faq_topic.title} successfully.")
    end

    private

    def set_faq_topic
      @faq_topic = FaqTopic.find(params[:id])
      authorize @faq_topic
    end

    def faq_topic_params
      params.require(:faq_topic).permit(:title)
    end
  end
end
