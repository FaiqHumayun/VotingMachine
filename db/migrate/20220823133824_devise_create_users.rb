# frozen_string_literal: true

# DeviseCreateUsers
class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :cnic, null: false
      t.boolean :voted, default: false
      t.string :constituency_name, null: false
      t.integer :total_votes_gain, default: 0
      t.string :party_name, default: ''
      t.integer :user_status, default: 0
      t.string :email,              null: false, default: ''
      t.string :encrypted_password, null: false, default: ''
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
