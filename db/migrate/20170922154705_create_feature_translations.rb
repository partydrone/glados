class CreateFeatureTranslations < ActiveRecord::Migration[5.0]
  def up
    # 1. Create translation table.
    create_table :feature_translations do |t|
      t.integer :feature_id, null: false
      t.string :locale, null: false
      t.string :title
      t.string :youtube_video_id
      t.text :description
      t.text :body

      t.timestamps

      t.index ['locale'], name: 'index_feature_translations_on_locale'
      t.index ['feature_id', 'locale'], name: 'index_feature_translations_on_feature_id_and_locale', unique: true
      t.index ['feature_id'], name: 'index_feature_translations_on_feature_id'
    end

    # 2. Copy data from parent to translation table.
    execute %{
      INSERT INTO feature_translations(feature_id, locale, title, youtube_video_id, description, body, created_at, updated_at)
      SELECT id, '#{I18n.default_locale.to_s}', title, youtube_video_id, description, body, created_at, updated_at FROM features;
    }

    # 3. Remove translated fields from parent table.
    remove_column :features, :title
    remove_column :features, :youtube_video_id
    remove_column :features, :description
    remove_column :features, :body
  end

  def down
    # 1. Add translated fields to parent table.
    add_column :features, :title, :string
    add_column :features, :youtube_video_id, :string
    add_column :features, :description, :text
    add_column :features, :body, :text

    # 2. Copy data from translation to parent table.
    execute %{
      UPDATE features a
      SET title = b.title,
          youtube_video_id = b.youtube_video_id,
          description = b.description,
          body = b.body
      FROM feature_translations b
      WHERE b.feature_id = a.id
      AND b.locale = '#{I18n.default_locale.to_s}';
    }

    # 3. Drop translation table.
    drop_table :feature_translations
  end
end
