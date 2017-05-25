class ChangeAddressColumnNames < ActiveRecord::Migration[5.0]
  def change
    rename_column :dealers, :city, :locality
    rename_column :dealers, :zip, :postal_code

    rename_column :offices, :city, :locality
    rename_column :offices, :zip, :postal_code
  end
end
