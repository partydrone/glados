class CreateJoinTableProductsSoftwareDownloads < ActiveRecord::Migration[5.0]
  def change
    create_join_table :products, :software_downloads do |t|
      # t.index [:product_id, :software_download_id]
      # t.index [:software_download_id, :product_id]
    end
  end
end
