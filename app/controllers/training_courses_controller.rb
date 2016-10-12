class TrainingCoursesController < ApplicationController
  before_action :set_training_course, only: [:edit, :update, :destroy]

  def index
    @training_courses = TrainingCourse.all
  end

  def new
    @training_course = TrainingCourse.new
  end

  def edit
  end

  def create
    @training_course = TrainingCourse.new(training_course_params)

    if @training_course.save
      redirect_to training_courses_path, notice: %(Saved "#{@training_course.title}" successfully.)
    else
      set_training_course_types
      render :new
    end
  end

  def update
    if @training_course.update(training_course_params)
      redirect_to training_courses_path, notice: %(Updated "#{@training_course.title}" successfully.)
    else
      set_training_course_types
      render :edit
    end
  end

  def destroy
    @training_course.destroy
    redirect_to training_courses_path, notice: %(Deleted "#{@training_course.title}" successfully.)
  end

  private

  def set_training_course
    @training_course = TrainingCourse.find(params[:id])
  end

  def training_course_params
    params.require(:training_course).permit(:title, :description, :number, :duration, :seats, :training_course_type_id)
  end
end
