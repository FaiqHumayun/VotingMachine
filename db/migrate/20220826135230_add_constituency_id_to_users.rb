# frozen_string_literal: true

# AddConstituencyIdToUsers
class AddConstituencyIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :constituency, index: true
    add_foreign_key :users, :constituencies
  end
end
