# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    association :constituency, factory: :constituency
    name { Faker::Name.name }
    email { Faker::Internet.unique.email }
    cnic { '1122334455667' }
    password { 54_564_646_465 }
    constituency_name { Faker::Name.name }
    avatar { Rack::Test::UploadedFile.new('app/assets/images/df.jpg', 'df.jpg') }
    # trait :with_avatar do
    #   after :create do |user|
    #     user.avatar.attach(Faker::Avatar.avatar)

    #   end
    # end
  end
end
