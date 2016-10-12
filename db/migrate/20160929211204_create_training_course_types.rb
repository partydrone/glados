class CreateTrainingCourseTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :training_course_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
