# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :topic do
    title {Faker::Lorem.characters(10)}
    seq_number 1
    contents { [ FactoryGirl.build(:content)]}
    questions { [ FactoryGirl.build(:question)] }
  end
end