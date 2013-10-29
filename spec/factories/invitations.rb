# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :invitation do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    address {Faker::Address.street_name}
    phone_number {Faker::PhoneNumber.phone_number}
    text {Faker::Lorem.words(2)}
  end
end
