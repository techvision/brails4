# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :feedback do |f|
    f.name {Faker::Name.name}
    f.email {Faker::Internet.email}
    f.country "India"
    f.text {Faker::Lorem.sentence(2)}
  end
end
