class AddCountryIdsToMediaDownloads < ActiveRecord::Migration[5.0]
  def change
    add_column :media_downloads, :country_ids, :text, array: true, default: []
  end
end
