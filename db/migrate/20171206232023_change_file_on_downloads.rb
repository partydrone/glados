class ChangeFileOnDownloads < ActiveRecord::Migration[5.0]
  def change
    remove_column :downloads, :locale, :string
    remove_column :downloads, :file_id, :string
    remove_column :downloads, :file_filename, :string
    remove_column :downloads, :file_size, :integer
    remove_column :downloads, :file_content_type, :string

    add_column :downloads, :file, :string
  end
end
