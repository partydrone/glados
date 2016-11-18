class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :part_number
      t.string :summary
      t.text :description
      t.date :expired_on
      t.references :product_category

      t.timestamps
    end
  end
end
