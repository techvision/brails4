# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do |q|
    q.title {Faker::Lorem.sentence(1)}
    q.options {[ FactoryGirl.build(:option), FactoryGirl.build(:option, correct: false), FactoryGirl.build(:option, correct: false) ]}
    q.attempts { [ FactoryGirl.build(:attempt)]}
    q.difficulty { FactoryGirl.build(:difficulty)}
  end
end
