class CreateDownloads < ActiveRecord::Migration[5.0]
  def change
    create_table :downloads do |t|
      t.string :locale
      t.string :title
      t.string :part_number
      t.references :download_type, foreign_key: true
      t.text :attachment_data

      t.timestamps
    end
  end
end
