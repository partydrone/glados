class AddHostToTrainingEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :training_events, :host, :string
  end
end
