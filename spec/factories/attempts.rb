# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :attempt do
  end

  factory :solved_attempt do
    solved true
  end
end
