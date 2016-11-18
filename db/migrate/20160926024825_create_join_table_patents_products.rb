class CreateJoinTablePatentsProducts < ActiveRecord::Migration[5.0]
  def change
    create_join_table :patents, :products do |t|
      # t.index [:patent_id, :product_id]
      # t.index [:product_id, :patent_id]
    end
  end
end
