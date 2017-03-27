class CreateJoinTablePrerequisitesTrainingCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :prerequisites_training_courses do |t|
      t.integer :prerequisite_id
      t.integer :training_course_id
    end
  end
end
