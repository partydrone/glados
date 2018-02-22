class UpdateForActsAsTaggableEngine < ActiveRecord::Migration[5.0]
  def change
    change_table :taggings do |t|
      t.references :tagger, polymorphic: true
      t.string :context, limit: 128

      t.remove_index [:taggable_type, :taggable_id]

      t.index :taggable_id
      t.index :taggable_type
      t.index :tagger_id
      t.index :context

      t.index [:taggable_id, :taggable_type, :context]
      t.index [:tagger_id, :tagger_type]

      t.index [:tag_id, :taggable_id, :taggable_type, :context, :tagger_id, :tagger_type], name: 'taggings_idx', unique: true
      t.index [:taggable_id, :taggable_type, :tagger_id, :context], name: 'taggings_idy'
    end
  end
end
