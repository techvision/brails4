require 'spec_helper'

describe Admin::AttemptsController do
  let(:user) { FactoryGirl.create(:user)}
  let(:level) { FactoryGirl.create(:level)}
  let(:achievement) { FactoryGirl.create(:achievement, user_id: user.id, topic_id: topic.id)}
  let(:question) { level.topics.last.contents.last.questions.last }
  let(:correct_option) { question.options.find_by(correct: true)}
  let(:incorrect_option){ question.options.find_by(correct: false)}
  let(:attempt) { FactoryGirl.create(:attempt, )}

  describe "GET #index" do



  end

  describe "GET #show" do


  end
end