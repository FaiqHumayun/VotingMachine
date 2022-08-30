# frozen_string_literal: true

# CreateConstituencies
class CreateConstituencies < ActiveRecord::Migration[5.2]
  def change
    create_table :constituencies do |t|
      t.string :name, null: false
      t.string :winner_candidate_name, default: ''

      t.timestamps
    end
  end
end
