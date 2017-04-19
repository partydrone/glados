class AddPositionToOffices < ActiveRecord::Migration[5.0]
  def change
  	add_column :offices, :position, :integer
  end
end
