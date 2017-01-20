class TrainingEventsController < ApplicationController
  def index
    @training_events = TrainingEvent.all
  end

  def show
    @training_event = TrainingEvent.find(params[:id])
  end
end
