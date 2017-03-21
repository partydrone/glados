class CreateEnrollment < ActiveRecord::Migration[5.0]
  def change
    create_table :enrollments do |t|
      t.belongs_to :training_event_course, index: true
      t.string :first_name
      t.string :last_name
      t.string :email
    end
  end
end
