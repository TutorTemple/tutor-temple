# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  sequence(:email)          { Faker::Internet.email }
  sequence(:first_name)     { Faker::Name.first_name }
  sequence(:last_name)      { Faker::Name.last_name }
  sequence(:name)           { Faker::Name.name }
  sequence(:password)       { '1pas$Word' }
  sequence(:phone)          { Faker::Number.number(10) }
  sequence(:gender)         { Faker::Gender.binary_type }
  sequence(:birthday)       { Faker::Date.birthday }
  # sequence(:avatar)         { File.open("#{Rails.root}/spec/files/avatar.png") }

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

  factory :profile do
    association :user, factory: :student
    first_name
    last_name
    gender
    birthday
    # avatar
  end
end
