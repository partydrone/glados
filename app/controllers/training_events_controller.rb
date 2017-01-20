class TrainingEventsController < ApplicationController
  before_action :set_training_event, only: [:edit, :update, :destroy]

  def index
    @training_events = TrainingEvent.all
  end

  
  private

  def set_training_event
    @training_event = TrainingEvent.find(params[:id])
  end

  def training_event_params
    params.require(:training_event).permit(:title, :description, :started_at, :ended_at, :location)
  end
end
