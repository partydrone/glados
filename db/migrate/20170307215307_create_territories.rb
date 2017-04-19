class CreateTerritories < ActiveRecord::Migration[5.0]
  def change
    create_table :territories do |t|
    	t.string :name
    	t.string :country
    	t.string :office
    	t.string :dealer

    	t.timestamps
    end
  end
end