class AddDefaultValueToArticleViews < ActiveRecord::Migration[5.0]
  def up
    change_column :articles, :views, :integer, default: 0
  end
end
