# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :topic do
    title {Faker::Lorem.characters(10)}
    seq_number 1

    factory :topic_with_content do
      contents { [ build(:full_content)]}
    end

    factory :topic_with_question do
      questions { [ build(:full_question)] }
    end

    factory :full_topic do
      contents { [ build(:full_content)]}
      questions { [ build(:full_question)] }
    end
  end
end