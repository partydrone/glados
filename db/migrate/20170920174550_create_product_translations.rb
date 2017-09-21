class CreateProductTranslations < ActiveRecord::Migration[5.0]
  def change
    reversible do |dir|
      dir.up do
        Product.create_translation_table!({
          summary: :string,
          description: :text,
          youtube_video_id: :string
        }, {
          migrate_data: true,
          remove_source_columns: true
        })
      end

      dir.down do
        Product.drop_translation_table! migrate_data: true
      end
    end
  end
end
