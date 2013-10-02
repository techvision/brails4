# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :invitation do |l|
    l.name {Faker::Name.name}
    l.email {Faker::Internet.email}
    l.address {Faker::Address.street_name}
    l.phone_number {Faker::PhoneNumber.phone_number}
    l.text {Faker::Lorem.words(2)}
  end
end
