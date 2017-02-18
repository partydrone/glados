class EnrollmentsController < ApplicationController
  


  def create
    @enrollment = enrollment.new(enrollment_params)  
 

    if @enrollment.save
      redirect_to training_event_path, notice: %(Saved "#{@enrollment.first_name}" successfully.)
    else
      render :new      
    end
  end

  private

  def enrollment_params
    params.require(:enrollment).permit(:first_name, :last_name, :email)
  end

end
