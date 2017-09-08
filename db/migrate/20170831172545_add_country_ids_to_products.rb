class AddCountryIdsToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :country_ids, :text, array: true, default: []
  end
end
