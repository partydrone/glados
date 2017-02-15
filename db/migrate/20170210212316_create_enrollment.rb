class CreateEnrollment < ActiveRecord::Migration[5.0]
  def change
    create_table :enrollments do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
    end
  end
end
