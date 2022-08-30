# frozen_string_literal: true

# CreateRequests
class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.string :name, null: false
      t.string :cnic, null: false
      t.string :party_name, null: false

      t.timestamps
    end
  end
end
