module Admin
    class TrainingEventCoursesController < BaseController

        def index
            @training_event_courses = TrainingEventCourses.all
        end



        def new
            @training_event_course = TrainingEventCourses.new
        end

        def edit
        end


        def create
            @training_event_course = TrainingEventCourses.new(training_event_courses_params)      
        
        
            if @training_event_course.save
                redirect_to admin_training_events_path, notice: %(Saved "#{@training_event.title}" successfully.)        
            else
                render :new
            end
        end


        def training_event_courses_params
            params.require(:training_event_course).permit(:training_event_id, :training_course_id, :seats, :started_at)
        end

    end
end