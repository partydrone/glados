class User < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :role
      t.string :auth_token

      t.timestamps
    end

    add_index :users, :auth_token, unique: true
  end
end
