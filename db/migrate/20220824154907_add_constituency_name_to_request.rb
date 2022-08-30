# frozen_string_literal: true

# AddConstituencyNameToRequest
class AddConstituencyNameToRequest < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :constituency_name, :string, null: false
  end
end
