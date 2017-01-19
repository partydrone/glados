class TrainingCourseTypesController < BaseController
  before_action :set_training_course_type, only: [:edit, :update, :destroy]

  def index
    @training_course_types = TrainingCourseType.all
  end

  def new
    @training_course_type = TrainingCourseType.new
  end

  def edit
  end

  def create
    @training_course_type = TrainingCourseType.new(training_course_type_params)

    if @training_course_type.save
      redirect_to admin_training_course_types_path, notice: %(Saved "#{@training_course_type.name}" successfully.)
    else
      render :new
    end
  end

  def update
    if @training_course_type.update(training_course_type_params)
      redirect_to admin_training_course_types_path, notice: %(Updated "#{@training_course_type.name}" successfully.)
    else
      render :edit
    end
  end

  def destroy
    @training_course_type.destroy
    redirect_to admin_training_course_types_path, notice: %(Deleted "#{@training_course_type.name}" successfully.)
  end

  private

  def set_training_course_type
    @training_course_type = TrainingCourseType.find(params[:id])
  end

  def training_course_type_params
    params.require(:training_course_type).permit(:name)
  end
end
