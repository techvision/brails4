# Read about factories at https://github.com/thoughtbot/factory_girl
include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :content do
    title {Faker::Lorem.characters(25)}
    body {Faker::Lorem.sentence(10)}
    summary {Faker::Lorem.sentence(5)}
    audio_mp3 {fixture_file_upload("#{Rails.root}/spec/factories/support/Sample.mp3", "audio/mp3")}
    audio_ogg {fixture_file_upload("#{Rails.root}/spec/factories/support/Sample.ogg", "audio/ogg")}
  
    factory :content_with_questions do
      questions {[ build(:question)]}
    end

    factory :content_with_comments do
      comments {[ build(:comment)]}
    end

    factory :full_content do
      questions {[ build(:question)]}
      comments {[ build(:comment)]}
    end
  end
end