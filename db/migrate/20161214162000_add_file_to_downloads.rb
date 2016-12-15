class AddFileToDownloads < ActiveRecord::Migration[5.0]
  def change
    add_column :downloads, :file_id, :string
    add_column :downloads, :file_filename, :string
    add_column :downloads, :file_size, :integer
    add_column :downloads, :file_content_type, :string
    
    remove_column :downloads, :attachment_data, :text
  end
end
