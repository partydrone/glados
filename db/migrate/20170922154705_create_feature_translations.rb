class CreateFeatureTranslations < ActiveRecord::Migration[5.0]
  def change
    reversible do |dir|
      dir.up do
        Feature.create_translation_table!({
          title: :string,
          youtube_video_id: :string,
          description: :text,
          body: :text
        }, {
          migrate_data: true,
          remove_source_columns: true
        })
      end

      dir.down do
        Feature.drop_translation_table! migrate_data: true
      end
    end
  end
end
