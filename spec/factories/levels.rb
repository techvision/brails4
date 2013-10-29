# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :level do
    name { Faker::Lorem.characters(10) }
    topics { [ FactoryGirl.build(:topic)] }
    questions { [ FactoryGirl.build(:question)]}
    seq_number 1
  end
end