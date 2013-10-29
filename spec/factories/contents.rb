# Read about factories at https://github.com/thoughtbot/factory_girl
include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :content do
    title {Faker::Lorem.characters(25)}
    body {Faker::Lorem.sentence(10)}
    summary {Faker::Lorem.sentence(5)}
    questions {[ FactoryGirl.build(:question)]}
    comments {[ FactoryGirl.build(:comment)]}
    audio_mp3 {fixture_file_upload("#{Rails.root}/spec/factories/support/Sample.mp3", "audio/mp3")}
    audio_ogg {fixture_file_upload("#{Rails.root}/spec/factories/support/Sample.ogg", "audio/ogg")}
  end
end
