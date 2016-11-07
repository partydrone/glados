class CreateFeatures < ActiveRecord::Migration[5.0]
  def change
    create_table :features do |t|
      t.string :title
      t.text :billboard_data
      t.string :youtube_video_id
      t.text :description
      t.text :body

      t.timestamps
    end
  end
end
