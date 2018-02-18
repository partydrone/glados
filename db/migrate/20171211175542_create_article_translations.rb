class CreateArticleTranslations < ActiveRecord::Migration[5.0]
  def up
    # 1. Create translation table.
    create_table :article_translations do |t|
      t.integer :article_id, null: false
      t.string :locale, null: false
      t.string :title
      t.string :subtitle
      t.text :body
      t.integer :views

      t.timestamps

      t.index ['locale'], name: 'index_article_translations_on_locale'
      t.index ['article_id', 'locale'], name: 'index_article_translations_on_article_id_and_locale', unique: true
      t.index ['article_id'], name: 'index_article_translations_on_article_id'
    end

    # 2. Copy data from parent to translation table.
    execute %{
      INSERT INTO article_translations(article_id, locale, title, subtitle, body, views, created_at, updated_at)
      SELECT id, '#{I18n.default_locale.to_s}', title, subtitle, body, views, created_at, updated_at FROM articles;
    }

    # 3. Remove translated fields from parent table.
    remove_column :articles, :title
    remove_column :articles, :subtitle
    remove_column :articles, :body
    remove_column :articles, :views
  end

  def down
    # 1. Add translated fields to parent table.
    add_column :articles, :title, :string
    add_column :articles, :subtitle, :string
    add_column :articles, :body, :text
    add_column :articles, :views, :integer

    # 2. Copy data from translation to parent table.
    execute %{
      UPDATE articles a
      SET title = b.title,
          subtitle = b.subtitle,
          body = b.body,
          views = b.views
      FROM article_translations b
      WHERE b.article_id = a.id
      AND b.locale = '#{I18n.default_locale.to_s}';
    }

    # 3. Drop translation table.
    drop_table :article_translations
  end
end
