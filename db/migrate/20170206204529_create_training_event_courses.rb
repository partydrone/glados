class CreateTrainingEventCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :training_event_courses do |t|
      t.references :training_course
      t.references :training_event
      t.integer :seats
      t.datetime :started_at

      t.timestamps
    end
  end
end
