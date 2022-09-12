# frozen_string_literal: true

FactoryBot.define do
  factory :schedule do
    election_start_time { DateTime.now }
    election_end_time { DateTime.tomorrow }
  end
end
