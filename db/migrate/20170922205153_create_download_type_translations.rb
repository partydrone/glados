class CreateDownloadTypeTranslations < ActiveRecord::Migration[5.0]
  def up
    # 1. Create translation table.
    create_table :download_type_translations do |t|
      t.integer :download_type_id, null: false
      t.string :locale, null: false
      t.string :name

      t.timestamps

      t.index ['locale'], name: 'index_download_type_translations_on_locale'
      t.index ['download_type_id', 'locale'], name: 'index_download_type_translations_on_download_type_id_and_locale', unique: true
      t.index ['download_type_id'], name: 'index_download_type_translations_on_download_type_id'
    end

    # 2. Copy data from parent to translation table.
    execute %{
      INSERT INTO download_type_translations(download_type_id, locale, name, created_at, updated_at)
      SELECT id, '#{I18n.default_locale.to_s}', name, created_at, updated_at FROM download_types;
    }

    # 3. Remove translated fields from parent table.
    remove_column :download_types, :name
  end

  def down
    # 1. Add translated fields to parent table.
    add_column :download_types, :name, :string

    # 2. Copy data from translation to parent table.
    execute %{
      UPDATE download_types a
      SET name = b.name
      FROM download_type_translations b
      WHERE b.download_type_id = a.id
      AND b.locale = '#{I18n.default_locale.to_s}';
    }

    # 3. Drop translation table.
    drop_table :download_type_translations
  end
end
