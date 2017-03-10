module Admin
    class EnrollmentsController < BaseController  


        def show
            #@training_event_course = TrainingEventCourse.includes(enrollments: [:enrollments]).find(params[:id])
            @training_event_course = TrainingEventCourse.find(params[:id])

        end










    end
end