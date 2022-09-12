# frozen_string_literal: true

FactoryBot.define do
  factory :request do
    name { Faker::Name.name }
    constituency_name { Faker::Name.name }
    party_name { Faker::Name.name }
    cnic { '1122334455667' }
    request_status { 0 }
    avatar { Rack::Test::UploadedFile.new('app/assets/images/df.jpg', 'df.jpg') }
  end
end
