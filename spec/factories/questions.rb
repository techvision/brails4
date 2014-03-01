# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    title {Faker::Lorem.sentence(1)}
    difficulty EASY

    factory :question_with_comments do
      comments {[ build(:comment)]}
    end

    factory :full_question do
      options {[ FactoryGirl.build(:option), FactoryGirl.build(:incorrect_option), FactoryGirl.build(:incorrect_option) ]}
      comments {[ create(:comment)]}
    end
  end
end
