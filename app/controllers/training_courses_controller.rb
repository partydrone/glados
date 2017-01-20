class TrainingCoursesController < ApplicationController
  before_action :set_training_course, only: [:edit, :update, :destroy]

  def index
    @training_courses = TrainingCourse.all
  end

  

  private

  def set_training_course
    @training_course = TrainingCourse.find(params[:id])
  end

  def training_course_params
    params.require(:training_course).permit(:title, :description, :number, :duration, :seats, :training_course_type_id)
  end
end
