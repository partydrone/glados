class RenameOfficesToSalesOffices < ActiveRecord::Migration[5.0]
  def change
    rename_table :offices, :sales_offices
    rename_column :sales_offices, :country, :country_id

    reversible do |dir|
      dir.up { change_column :sales_offices, :country_id, :string, limit: 2 }
      dir.down { change_column :sales_offices, :country_id, :string}
    end

    remove_column :sales_offices, :position, :integer
  end
end
