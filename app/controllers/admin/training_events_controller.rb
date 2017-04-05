module Admin
  class TrainingEventsController < BaseController
    before_action :set_training_event, only: [:show, :edit, :update, :destroy]

    def index
      @training_events = TrainingEvent.all
    end

    def show      
    end

    def new
      @training_event = TrainingEvent.new
      @training_event.training_event_courses.build
    end

    def edit      
    end

    def create
      @training_event = TrainingEvent.new(training_event_params)

      if @training_event.save
        redirect_to admin_training_events_path, notice: %(Saved "#{@training_event.title}" successfully.)
      else
        render :new
      end
    end

    def update           

      if @training_event.update_attributes(training_event_params)
        redirect_to admin_training_events_path, notice: %(Updated "#{@training_event.title}" successfully.)
      else
        render :edit
      end
    end

    def destroy  
      
      @training_event.destroy
      redirect_to admin_training_events_path, notice: %(Deleted "#{@training_event.title}" successfully.)
    end

    private

    def set_training_event
      @training_event = TrainingEvent.includes(training_event_courses: [:training_course]).find(params[:id])
    end

    def training_event_params
      params.require(:training_event).permit(:id, :title, :description, :started_at, :ended_at, :location, training_event_courses_attributes: [:id, :training_course_id, :seats, :room, :started_at, :_destroy, enrollments_attributes: [:id, :first_name, :last_name, :email, :_destroy]])
    end
  end
end
