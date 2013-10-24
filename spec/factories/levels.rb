# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :level do |l|
    l.name { Faker::Lorem.characters(10) }
    l.topics { [ FactoryGirl.build(:topic)] }
    l.bonus_questions{[ FactoryGirl.build(:question)]}
    l.seq_number 1
  end
end
