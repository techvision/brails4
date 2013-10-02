# Read about factories at https://github.com/thoughtbot/factory_girl
include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :content do |c|
    c.title "MyString"
    c.body "Test"
    c.summary "abc"
    c.questions {[ FactoryGirl.build(:question)]}
    c.comments {[ FactoryGirl.build(:comment)]}
    c.audio_mp3 {fixture_file_upload("#{Rails.root}/spec/factories/support/Sample.mp3", "audio/mp3")}
    c.audio_ogg {fixture_file_upload("#{Rails.root}/spec/factories/support/Sample.ogg", "audio/ogg")}
  end
end
