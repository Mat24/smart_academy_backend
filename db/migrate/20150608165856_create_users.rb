class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username, null: false
      t.string :password_hash, null: false
      t.string :first_name, null: false
      t.string :last_name
      t.string :phone
      t.string :email
      t.string :user_type
      t.timestamps null: false
    end
  end
  def self.down
    drop_table :users
  end
end
