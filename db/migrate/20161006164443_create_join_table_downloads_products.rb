class CreateJoinTableDownloadsProducts < ActiveRecord::Migration[5.0]
  def change
    create_join_table :downloads, :products do |t|
      # t.index [:download_id, :product_id]
      # t.index [:product_id, :download_id]
    end
  end
end
