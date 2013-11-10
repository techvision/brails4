# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :level do
    name { Faker::Lorem.characters(10) }
    seq_number 1

    factory :level_with_topic do
      topics { [ build(:full_topic)] }
    end

    factory :level_with_question do

      ignore do
        questions_count 1
      end

      after(:build) do |level, evaluator|
        FactoryGirl.create_list(:full_question, evaluator.questions_count, questionable: level)
      end

      factory :full_level do
        topics { [ create(:full_topic)] }
      end
    end
  end
end