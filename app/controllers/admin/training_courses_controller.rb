module Admin
  class TrainingCoursesController < BaseController
    before_action :set_training_course, only: [:edit, :update, :destroy]
    before_action :set_product_types, only: [:new, :edit]

    def index
      @training_courses = TrainingCourse.all
      authorize @training_courses
    end

    def new
      @training_course = TrainingCourse.new
      authorize @training_course
      @training_courses = TrainingCourse.all
    end

    def edit
      @training_courses = TrainingCourse.where.not(id: @training_course.id)
    end

    def create
      @training_course = TrainingCourse.new(training_course_params)
      authorize @training_course

      if @training_course.save
        redirect_to admin_training_courses_path, notice: %(Saved "#{@training_course.title}" successfully.)
      else
        render :new
      end
    end

    def update
      if @training_course.update(training_course_params)
        redirect_to admin_training_courses_path, notice: %(Updated "#{@training_course.title}" successfully.)
      else
        render :edit
      end
    end

    def destroy
      @training_course.destroy
      redirect_to admin_training_courses_path, notice: %(Deleted "#{@training_course.title}" successfully.)
    end

    private

    def set_training_course
      @training_course = TrainingCourse.find(params[:id])
      authorize @training_course
    end

    def training_course_params
      params.require(:training_course).permit(:title, :description, :number, :duration, :summary, :seats, :training_course_type_id, prerequisite_ids: [], product_ids: [])
    end

    def set_product_types
      @product_types = ProductType.includes(:products).reorder(:position).order('products.name')
    end
  end
end
