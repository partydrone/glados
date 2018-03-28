class CreateFaqTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :faq_topics do |t|
      t.string :title

      t.timestamps
    end
  end
end
