# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :level do |l|
    l.name {Faker::Lorem.sentence(3)}
    l.topics { [ FactoryGirl.build(:topic) ]}
  end
end
