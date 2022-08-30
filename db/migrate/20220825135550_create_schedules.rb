# frozen_string_literal: true

class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.datetime :election_start_time
      t.datetime :election_end_time

      t.timestamps
    end
  end
end
