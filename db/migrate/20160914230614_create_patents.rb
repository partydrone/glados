class CreatePatents < ActiveRecord::Migration[5.0]
  def change
    create_table :patents do |t|
      t.integer :number
      t.string :title
    end
    add_index :patents, :number, unique: true
  end
end
