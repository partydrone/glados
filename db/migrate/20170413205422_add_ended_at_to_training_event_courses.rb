class AddEndedAtToTrainingEventCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :training_event_courses, :ended_at, :datetime
  end
end
