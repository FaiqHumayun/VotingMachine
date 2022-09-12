# frozen_string_literal: true

FactoryBot.define do
  factory :constituency do
    name { Faker::Name.name }
  end
end
