class CreateDownloadTranslations < ActiveRecord::Migration[5.0]
  def change
    reversible do |dir|
      dir.up do
        Download.create_translation_table!({
          title: :string,
          file: :string
        }, {
          migrate_data: true,
          remove_source_columns: true
        })
      end

      dir.down do
        Download.drop_translation_table! migrate_data: true
      end
    end
  end
end
