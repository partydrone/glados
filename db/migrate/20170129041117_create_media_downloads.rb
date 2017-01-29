class CreateMediaDownloads < ActiveRecord::Migration[5.0]
  def change
    create_table :media_downloads do |t|
      t.string :description
      t.string :file_id
      t.string :file_filename
      t.string :file_size
      t.string :file_content_type

      t.timestamps
    end
  end
end
