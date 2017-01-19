class TrainingEventsController < BaseController
  before_action :set_training_event, only: [:edit, :update, :destroy]

  def index
    @training_events = TrainingEvent.all
  end

  def new
    @training_event = TrainingEvent.new
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
    if @training_event.update(training_event_params)
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
    @training_event = TrainingEvent.find(params[:id])
  end

  def training_event_params
    params.require(:training_event).permit(:title, :description, :started_at, :ended_at, :location)
  end
end
