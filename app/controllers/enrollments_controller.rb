class EnrollmentsController < ApplicationController  
  
  def show    
    @training_event = TrainingEvent.includes(training_event_courses: [:training_course]).find(params[:id])    
  end

  def create       
    course_ids = params[:enrollment][:training_event_course_id]
    course_ids.delete("")
        
    course_ids.each do |e|      
      enrollment = Enrollment.new(training_event_course_id: e, first_name: params[:enrollment][:first_name], last_name: params[:enrollment][:last_name], email: params[:enrollment][:email])
      unless enrollment.save
        redirect_to enrollment_path, notice: %(Error in registration.)
      end
    end
    #send email
    @training_event = TrainingEvent.find(params[:enrollment][:training_event_id])
    @training_event.training_courses = TrainingCourse.find(course_ids)
    SiteMailer.enrollment(@training_event, params[:enrollment][:email]).deliver_now
    redirect_to enrollment_path controller: 'Enrollments', action: 'show', id: params[:enrollment][:training_event_id]
    
  end

  private

  def enrollment_params
    params.require(:enrollment).permit(:first_name, :last_name, :email, :training_event_course_id => [])
  end
end