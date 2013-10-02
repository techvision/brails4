# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile do
    name {Faker::Name.name}
    birthdate "10/10/2010"
    gender "male"
    address {Faker::Address.city}
    country "India"
  end
end
