# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password "123456789"

    factory :admin, class: User do
      role Role.where(name: Role::Admin).first
    end

    factory :student, class: User do
      role Role.where(name: Role::Student).first
    end
  end
end
