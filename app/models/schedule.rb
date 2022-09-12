# frozen_string_literal: true

class Schedule < ApplicationRecord
  validates :election_start_time, presence: true
  validates :election_end_time, presence: true
end
