# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :option do
    text {Faker::Lorem.characters(10)}
    correct true
  end

  factory :incorrect_option, class: Option do
    text {Faker::Lorem.characters(10)}
    correct false
  end
end
