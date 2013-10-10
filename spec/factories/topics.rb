# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :topic do |t|
    t.title {Faker::Lorem.characters(10)}
    t.seq_number "1"
    t.contents { [ FactoryGirl.build(:content)]}
  end
end