class TrainingEventsController < ApplicationController
  
  
  def index
    @training_events = TrainingEvent.all
    @training_courses = TrainingCourse.all 
  end

  def show
    @enrollment = Enrollment.new
    @training_event = TrainingEvent.find(params[:id])        
    @training_courses = TrainingCourse.find(TrainingEventCourse.where(:training_event_id => @training_event.id).pluck(:training_course_id))
  end
  
end
