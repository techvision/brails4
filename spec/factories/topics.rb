# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :topic do
    title {Faker::Lorem.characters(10)}
    seq_number 1

    factory :topic_with_content do
      contents { [ build(:full_content)]}
    end

    factory :topic_with_question do

      ignore do
        questions_count 1
      end

      after(:build) do |topic, evaluator|
        FactoryGirl.create_list(:full_question, evaluator.questions_count, questionable: topic)
      end

      factory :full_topic do
        contents { [ create(:full_content)]}
      end
    end
  end
end