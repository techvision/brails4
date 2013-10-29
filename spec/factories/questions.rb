# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    title {Faker::Lorem.sentence(1)}
    options {[ FactoryGirl.build(:option), FactoryGirl.build(:incorrect_option), FactoryGirl.build(:incorrect_option) ]}
    difficulty EASY
  end
end