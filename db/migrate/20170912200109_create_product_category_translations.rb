class CreateProductCategoryTranslations < ActiveRecord::Migration[5.0]
  def up
    # 1. Create translation table.
    create_table :product_category_translations do |t|
      t.integer :product_category_id, null: false
      t.string :locale, null: false
      t.string :name
      t.text :description

      t.timestamps

      t.index ['locale'], name: 'index_product_category_translations_on_locale'
      t.index ['product_category_id', 'locale'], name: 'index_product_category_translations_on_prod_cat_id_and_locale', unique: true
      t.index ['product_category_id'], name: 'index_product_category_translations_on_product_category_id'
    end

    # 2. Copy data from parent to translation table.
    execute %{
      INSERT INTO product_category_translations(product_category_id, locale, name, description, created_at, updated_at)
      SELECT id, '#{I18n.default_locale.to_s}', name, description, created_at, updated_at FROM product_categories;
    }

    # 3. Remove translated fields from parent table.
    remove_column :product_categories, :name
    remove_column :product_categories, :description
  end

  def down
    # 1. Add translated fields to parent table.
    add_column :product_categories, :name, :string
    add_column :product_categories, :description, :text

    # 2. Copy data from translation to parent table.
    execute %{
      UPDATE product_categories a
      SET name = b.name,
          description = b.description
      FROM product_category_translations b
      WHERE b.product_category_id = a.id
      AND b.locale = '#{I18n.default_locale.to_s}';
    }

    # 3. Drop translation table.
    drop_table :product_category_translations
  end
end
