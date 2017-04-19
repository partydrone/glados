class AddSummaryToTrainingCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :training_courses, :summary, :string
  end
end
