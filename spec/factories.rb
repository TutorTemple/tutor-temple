# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  sequence(:email)          { Faker::Internet.email }
  sequence(:first_name)     { Faker::Name.first_name }
  sequence(:last_name)      { Faker::Name.last_name }
  sequence(:name)           { Faker::Name.name }
  sequence(:password)       { '1pas$Word' }
  sequence(:phone)          { Faker::Number.number(10) }

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
    end
  end
end
