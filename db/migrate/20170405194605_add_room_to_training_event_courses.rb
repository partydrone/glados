class AddRoomToTrainingEventCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :training_event_courses, :room, :string
  end
end
