class AddTaggingsCountToTags < ActiveRecord::Migration[5.0]
  def change
    add_column :tags, :taggings_count, :integer
  end
end
