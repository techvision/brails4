require 'spec_helper'

describe Admin::AttemptsController do
  login(:admin)
  let(:profile){ FactoryGirl.create(:profile)}
  let(:level){ FactoryGirl.create(:level)}
  let(:question) { level.topics.first.contents.first.questions.first}
  let(:attempt) { FactoryGirl.build(:attempt, profile_id: profile.id, question_id: question.id )}

  before(:each) do
    profile.attempts << attempt
  end

  describe "GET #index" do
    it "assigns an array of attempts" do
      get :index, user_id: profile.user_id

      page_attempts = assigns[:attempts]

      expect(attempt).to eql page_attempts
    end

    it "renders the :index view" do
      get :index, user_id: profile.user_id

      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested attempt to @attempt" do
      get :show, user_id: profile.user_id, id: attempt.id

      page_attempt = assigns[:attempt]

      expect(attempt).to eql page_attempt
    end

    it "renders the :show view" do
      get :show, user_id: profile.user_id, id: attempt.id

      expect(response).to render_template :show
    end
  end
end