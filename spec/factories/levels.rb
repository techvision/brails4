# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :level do
    name { Faker::Lorem.characters(10) }
    seq_number 1

    factory :level_with_topic do
      topics { [ build(:full_topic)] }
    end

    factory :level_with_question do
      questions { [ build(:question)]}
    end

    factory :full_level do
      topics { [ build(:full_topic)] }
      questions { [ build(:question)]}
    end
  end
end