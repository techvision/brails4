# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :attempt do
    increase_count 1
    solved false
    coins 1
  end
end
