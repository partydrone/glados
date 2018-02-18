class CreateSoftwareDownloads < ActiveRecord::Migration[5.0]
  def change
    create_table :software_downloads do |t|
      t.string :title
      t.string :file_id
      t.string :file_filename
      t.string :file_size
      t.string :file_content_type
    end
  end
end
