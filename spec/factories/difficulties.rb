# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :difficulty do
    name {Faker::Lorem.sentence(1)}
    points 1
  end
end
