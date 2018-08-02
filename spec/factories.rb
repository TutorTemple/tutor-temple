# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :authentication_provider do
    name "MyString"
  end
  sequence(:email)          { Faker::Internet.email }
  sequence(:first_name)     { Faker::Name.first_name }
  sequence(:last_name)      { Faker::Name.last_name }
  sequence(:name)           { Faker::Name.name }
  sequence(:password)       { '1pas$Word' }
  sequence(:phone)          { Faker::Number.number(10) }
  sequence(:gender)         { Faker::Gender.binary_type.downcase }
  sequence(:birthday)       { Faker::Date.birthday }

  factory :user do
    email
    password

    factory :student do
      role :student
    end

    factory :tutor do
      role :tutor
    end

    factory :admin do
      role :admin

      after :create do |record|
        record.profile = create(:profile, user: record)
      end
    end
  end

  factory :profile do
    association :user, factory: :student
    first_name
    last_name
    gender
    birthday
    languages %w[en uk]
    time_zone Time.zone.name
  end

  factory :subject do
    name
  end
end
