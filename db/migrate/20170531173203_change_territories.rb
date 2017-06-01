class ChangeTerritories < ActiveRecord::Migration[5.0]
  def change
    rename_table :territories, :sales_territories

    rename_column :sales_territories, :dealer, :dealer_id
    rename_column :sales_territories, :office, :sales_office_id

    reversible do |dir|
      dir.up do
        execute <<-SQL
          UPDATE sales_territories
          SET dealer_id = 0
          WHERE dealer_id IS NULL;
        SQL

        change_column :sales_territories, :dealer_id, 'integer USING CAST(dealer_id AS integer)'
        change_column :sales_territories, :sales_office_id, 'integer USING CAST(sales_office_id AS integer)'

        execute <<-SQL
          UPDATE sales_territories
          SET dealer_id = NULL
          WHERE dealer_id = 0;
        SQL
      end

      dir.down do
        change_column :sales_territories, :dealer_id, :string
        change_column :sales_territories, :sales_office_id, :string
      end
    end

    remove_column :sales_territories, :country, :string
    add_reference :sales_territories, :sales_region
  end
end
