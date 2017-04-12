class CreateOffices < ActiveRecord::Migration[5.0]
  def change
    create_table :offices do |t|
    	t.string :name
    	t.string :address
    	t.string :city
    	t.string :region
    	t.string :zip
    	t.string :country
    	t.string :phone
    	t.string :email

    	t.timestamps
    end
  end
end