require 'spec_helper'

describe Admin::AttemptsController do
  login(:admin)
  let(:user){ FactoryGirl.create(:user)}
  let(:level){ FactoryGirl.create(:level)}
  let(:question) { level.topics.first.contents.first.questions.first}
  let(:attempt) { FactoryGirl.create(:attempt,user_id: user.id, question_id: question.id )}

  describe "GET #index" do
    it "assigns an array of attempts" do
      get :index, user_id: user.id

      page_attempts = assigns[:attempts]

      expect(attempt).to eql page_attempts
    end

    it "renders the :index view" do
      get :index, user_id: user.id

      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested attempt to @attempt" do
      get :show, user_id: user.id, id: attempt.id

      page_attempt = assigns[:attempt]

      expect(attempt).to eql page_attempt
    end

    it "renders the :show view" do
      get :show, user_id: user.id, id: attempt.id

      expect(response).to render_template :show
    end
  end
end