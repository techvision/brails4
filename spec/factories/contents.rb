# Read about factories at https://github.com/thoughtbot/factory_girl
include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :content do
    title {Faker::Lorem.characters(25)}
    body {Faker::Lorem.sentence(10)}
    summary {Faker::Lorem.sentence(5)}
    audio_mp3 {fixture_file_upload("#{Rails.root}/spec/factories/support/Sample.mp3", "audio/mp3")}
    audio_ogg {fixture_file_upload("#{Rails.root}/spec/factories/support/Sample.ogg", "audio/ogg")}
  

    factory :content_with_comments do
      comments {[ build(:comment)]}
    end

    factory :content_with_questions do

      ignore do
        questions_count 1
      end

      after(:build) do |topic, evaluator|
        FactoryGirl.create_list(:full_question, evaluator.questions_count, questionable: topic)
      end

      factory :full_content do
        #comments {[ create(:comment)]}
      end
    end
  end
end
