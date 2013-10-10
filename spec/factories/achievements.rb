# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :achievement do
    user_id   { FactoryGirl.build(:topic).id }
    topic_id  { FactoryGirl.build(:topic).id }
  end
end
