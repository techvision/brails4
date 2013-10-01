# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :level do |l|
    l.name 'test'
    l.seq_number '1'
    l.topics { [ FactoryGirl.build(:topic) ]}
  end
end
