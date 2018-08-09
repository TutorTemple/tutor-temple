# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :education do
    degree "Ph. D."
    institution "CSTU"
    graduating_year "1992"
  end

  factory :user_authentication do
    user nil
    authentication_provider nil
  end
  factory :authentication_provider do
    name 'MyString'
  end

  sequence(:email)          { Faker::Internet.email }
  sequence(:first_name)     { Faker::Name.first_name }
  sequence(:last_name)      { Faker::Cat.name }
  sequence(:name)           { Faker::Fallout.character }
  sequence(:password)       { '1pas$Word' }
  sequence(:phone)          { Faker::Number.number(10) }
  sequence(:gender)         { Faker::Gender.binary_type.downcase }
  sequence(:birthday)       { Faker::Date.birthday }
  sequence(:company_name)   { Faker::Company.name }
  sequence(:title)          { Faker::Fallout.character }
  sequence(:location)       { Faker::Fallout.location }
  sequence(:start_date)     { Faker::Date.between(2.years.ago, 1.years.ago) }
  sequence(:end_date)       { Faker::Date.between(2.month.ago, 1.month.ago) }

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

  factory :work_experience do
    company_name
    title
    location
    start_date
    end_date
  end

  factory :facebook_provider, class: AuthenticationProvider do
    name 'facebook'
  end

  factory :google_provider, class: AuthenticationProvider do
    name 'google_oauth2'
  end

  factory :facebook_user_authentication, class: UserAuthentication do
    association :user
    association :authentication_provider, factory: :facebook_provider
    uid '4600051000057'
    token 'CAAXG7M01etEBAK4YZB7NotwpbxnSABZA6WE8Sc8BqNAUiZBf1OLMZCGsx3rZCr1udhYnB4bKOYhM6zwozruoXi4ZCqv7ia1fVHLOPn2fjlhOeoKOVVxceRzwv01YvgAQ3JqlaWTQS90EZBmEkAcNJ1y7He5K9UobsZBBCPavGZBXpeY3UfQh1L6XZCjmZBZBuztFoqqMrHWqhSfjwYQCYdEKTZCeI'
    token_expires_at { Date.today + 1.day }
  end
end
