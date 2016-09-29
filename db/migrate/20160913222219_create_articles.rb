class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :type
      t.string :title
      t.string :subtitle
      t.string :author
      t.string :location
      t.string :flag
      t.text :body
      t.date :posted_on

      t.timestamps
    end
  end
end
