class CreateJoinTableTrainingCourseProduct < ActiveRecord::Migration[5.0]
 def change
    create_table :training_course_products do |t|
      t.references :training_course, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :position
    end
  end
end
