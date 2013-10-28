# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do |u|
    u.email { Faker::Internet.email }
    u.password { Faker::Lorem.characters(10) }
    u.profile { FactoryGirl.build(:profile) }
    u.roles { ['student']}
  end
end
