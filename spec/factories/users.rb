# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Lorem.characters(10) }
    roles {[:student]}

    factory :admin, class: User do
      roles {[:admin]}
    end
  end
end
