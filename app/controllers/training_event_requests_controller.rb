class TrainingEventRequestsController < ApplicationController

  def new
    @training_event_request = TrainingEventRequest.new
    @training_courses = TrainingCourse.all
  end

  def create
    @training_event_request = TrainingEventRequest.new(training_event_request_params)
    @training_courses = TrainingCourse.find(@training_event_request.training_course_ids.reject!(&:empty?))
    if @training_event_request.valid?
      SiteMailer.training_event_request(@training_event_request, @training_courses).deliver_now
      redirect_to training_events_path, notice: "request sent"
    else
      @training_courses = TrainingCourse.all
      render :new
    end

  end

  private

  def training_event_request_params
    params.require(:training_event_request).permit(:company_name, :full_name, :email, :phone, :address, :locality, :region, :postal_code, :country_id, :started_at, :ended_at, :capacity, training_course_ids: [])
  end

end
