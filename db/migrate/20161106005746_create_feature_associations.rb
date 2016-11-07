class CreateFeatureAssociations < ActiveRecord::Migration[5.0]
  def change
    create_table :feature_associations do |t|
      t.references :feature, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :position

      t.timestamps
    end
  end
end
