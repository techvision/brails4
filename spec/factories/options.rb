# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :option do
    text "test"
    correct true
  end

  factory :incorrect_option, class: Option do
    text "test"
    correct false
  end
end
