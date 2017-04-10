class TrainingEventsController < ApplicationController
  def index
    @training_events = TrainingEvent.all
    @training_courses = TrainingCourse.all 
  end

  def show    
    @training_event = TrainingEvent.includes(:training_event_courses).find(params[:id])
    @enrollment = Enrollment.new
  end
end


