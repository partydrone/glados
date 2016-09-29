class CreateProductCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :product_categories do |t|
      t.string :name
      t.text :description
      t.integer :position
      t.references :product_type

      t.timestamps
    end
  end
end
