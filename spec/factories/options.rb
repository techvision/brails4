# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :option do
    text {Faker::Lorem.characters(10)}
    correct true

    factory :incorrect_option do
      correct false
    end
  end
end
