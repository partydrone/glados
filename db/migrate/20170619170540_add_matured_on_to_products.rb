class AddMaturedOnToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :matured_on, :date
  end
end
