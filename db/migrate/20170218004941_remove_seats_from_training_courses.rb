class RemoveSeatsFromTrainingCourses < ActiveRecord::Migration[5.0]
  def change
    remove_column :training_courses, :seats, :string
  end
end
