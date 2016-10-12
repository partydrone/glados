class CreateTrainingCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :training_courses do |t|
      t.string :title
      t.text :description
      t.string :number
      t.integer :duration
      t.integer :seats
      t.references :training_course_type

      t.timestamps
    end
  end
end
