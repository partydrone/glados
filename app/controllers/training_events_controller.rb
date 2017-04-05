class TrainingEventsController < ApplicationController
  
  
  def index
    @training_events = TrainingEvent.includes(training_event_courses: [:training_course]).all
    
    @training_events.each do |training_event|
      training_event.start_time = get_start_time(training_event).strftime("%I:%M %p")
    end

    @training_courses = TrainingCourse.all 
  end

  def show
    @training_event = TrainingEvent.includes(training_event_courses: [:training_course]).find(params[:id])
    @training_event.start_time = get_start_time(@training_event).strftime("%I:%M %p")
    @enrollment = Enrollment.new
  end

  private

  def get_start_time(training_event)
    if(training_event.training_event_courses.length > 0)
      start_time = training_event.training_event_courses[0].started_at    
      training_event.training_event_courses.each do |training_event_course|
        if (start_time > training_event_course.started_at)
          start_time = training_event_course.started_at
        end
      end
      return start_time
    end
  end
  
end


