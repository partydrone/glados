class CreateDealers < ActiveRecord::Migration[5.0]
  def change
    create_table :dealers do |t|
    	t.string :name
    	t.string :address
    	t.string :city
    	t.string :region
    	t.string :zip
    	t.string :country_id, limit: 2
    	t.string :phone
    	t.string :email
    	t.string :website

    	t.timestamps
    end
  end
end