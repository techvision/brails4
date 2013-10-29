# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :feedback do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    country "India"
    text {Faker::Lorem.sentence(2)}
  end
end
