class EnrollmentsController < ApplicationController  
  
  def show
    #@enrollment = Enrollment.find(params[:id])    
  end

  def create    
    training_event_id = params[:enrollment][:training_event_id]    
    first_name = params[:enrollment][:first_name]
    last_name = params[:enrollment][:last_name]
    email = params[:enrollment][:email]
    
    course_ids = params[:enrollment][:training_course_ids]
    course_ids.delete("")
    

    course_ids.each do |e|
      tci = TrainingEventCourse.where("training_event_id = ? AND training_course_id = ?", training_event_id, e).take(1).pluck(:id)
      enrollment = Enrollment.new(training_event_course_id: tci[0], first_name: first_name, last_name: last_name, email: email)
      unless enrollment.save
        redirect_to training_events_path, notice: %(Error couldn't register.)
      end
    end
    redirect_to training_events_path, notice: %(successful registration.)
  end

  private

  def enrollment_params
    params.require(:enrollment).permit(:first_name, :last_name, :email, :training_course_ids => [])
  end
end
 