class CreateSalesRegions < ActiveRecord::Migration[5.0]
  def change
    create_table :sales_regions do |t|
      t.string :name
      t.integer :position
      t.timestamps
    end
  end
end
