class EnrollmentsController < ApplicationController  
  
  def show
    @training_event = TrainingEvent.find(params[:id])
    @training_courses = TrainingCourse.find(params[:courses])
  end

  def create    
    training_event_id = params[:enrollment][:training_event_id]    
    first_name = params[:enrollment][:first_name]
    last_name = params[:enrollment][:last_name]
    email = params[:enrollment][:email]
    
    course_ids = params[:enrollment][:training_event_course_id]
    course_ids.delete("")
        
    course_ids.each do |e|
      teci = TrainingEventCourse.where("training_event_id = ? AND training_course_id = ?", training_event_id, e).take(1).pluck(:id).first
      enrollment = Enrollment.new(training_event_course_id: teci, first_name: first_name, last_name: last_name, email: email)
      unless enrollment.save
        redirect_to enrollment_path, notice: %(Error in registration.)
      end
    end
    #send email
    @training_event = TrainingEvent.find(training_event_id)
    @training_courses = TrainingCourse.find(course_ids)
    SiteMailer.enrollment(@training_event, @training_courses, email).deliver_now
    redirect_to enrollment_path controller: 'Enrollments', action: 'show', id: training_event_id, courses: course_ids
    
  end

  private

  def enrollment_params
    params.require(:enrollment).permit(:first_name, :last_name, :email, :training_event_course_id => [])
  end
end