class TrainingCourseTypesController < ApplicationController
  before_action :set_training_course_type, only: [:edit, :update, :destroy]

  def index
    @training_course_types = TrainingCourseType.all
  end

  
  private

  def set_training_course_type
    @training_course_type = TrainingCourseType.find(params[:id])
  end

  def training_course_type_params
    params.require(:training_course_type).permit(:name)
  end
end
