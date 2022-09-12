class Createtableschedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.datetime :election_start_time, null: false
      t.datetime :election_end_time, null: false

      t.timestamps
    end
  end
end
