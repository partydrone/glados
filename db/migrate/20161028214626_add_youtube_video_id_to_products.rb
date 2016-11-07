class AddYouTubeVideoIdToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :youtube_video_id, :string
  end
end
