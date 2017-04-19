class EnrollmentsController < ApplicationController  
  
  def index    
    @training_event = TrainingEvent.find(params[:id])
    @training_event_courses = TrainingEventCourse.find(params[:training_event_ids])      
  end

  def create       
    training_event_course_ids = params[:enrollment][:training_event_course_id]
    training_event_course_ids.delete("")
    
    enrollments = []

    training_event_course_ids.each do |e|  
      enrollments << Enrollment.new(training_event_course_id: e, first_name: params[:enrollment][:first_name], last_name: params[:enrollment][:last_name], email: params[:enrollment][:email])
    end

    enrollments.each do |enrollment|
      unless enrollment.save
        redirect_to enrollment_path, notice: %(Error in registration.)
      end
    end

    #send email
    SiteMailer.enrollment(params[:enrollment][:training_event_id], training_event_course_ids, params[:enrollment][:email]).deliver_now    
    redirect_to enrollments_path id: params[:enrollment][:training_event_id], training_event_ids: training_event_course_ids
    
  end

  private

  def enrollment_params
    params.require(:enrollment).permit(:first_name, :last_name, :email, :training_event_course_id => [])
  end
end