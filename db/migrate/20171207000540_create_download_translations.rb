class CreateDownloadTranslations < ActiveRecord::Migration[5.0]
  def up
    #1. Create translation table.
    create_table :download_translations do |t|
      t.integer :download_id, null: false
      t.string :locale, null: false
      t.string :title
      t.string :file_id
      t.string :file_filename
      t.integer :file_size
      t.string :file_content_type

      t.timestamps

      t.index ['locale'], name: 'index_download_translations_on_locale'
      t.index ['download_id', 'locale'], name: 'index_download_translations_on_download_id_and_locale', unique: true
      t.index ['download_id'], name: 'index_download_translations_on_download_id'
    end

    remove_column :downloads, :locale, :string

    # 2. Copy data from parent to translation table.
    execute %{
      INSERT INTO download_translations(download_id, locale, title, file_id, file_filename, file_size, file_content_type, created_at, updated_at)
      SELECT id, '#{I18n.default_locale.to_s}', title, file_id, file_filename, file_size, file_content_type, created_at, updated_at FROM downloads;
    }

    # 3. Remove translated fields from parent table.
    remove_column :downloads, :title
    remove_column :downloads, :file_id
    remove_column :downloads, :file_filename
    remove_column :downloads, :file_size
    remove_column :downloads, :file_content_type
  end

  def down
    # 1. Add translated fields to parent table.
    add_column :downloads, :title, :string
    add_column :downloads, :file_id, :string
    add_column :downloads, :file_filename, :string
    add_column :downloads, :file_size, :integer
    add_column :downloads, :file_content_type, :string

    # 2. Copy data from translation to parent table.
    execute %{
      UPDATE downloads a
      SET title = b.title,
          file_id = b.file_id,
          file_filename = b.file_filename,
          file_size = b.file_size,
          file_content_type = b.file_content_type
      FROM article_translations b
      WHERE b.article_id = a.id
      AND b.locale = '#{I18n.default_locale.to_s}';
    }
    
    # 3. Drop translation table.
    drop_table :download_translations
  end
end
