# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile do
    name {Faker::Name.name}
    gender "male"
    address {Faker::Address.city}
    country "India"
    association :user, factory: :user

    factory :admin_profile do
      association :user, factory: :admin
    end
  end
end
