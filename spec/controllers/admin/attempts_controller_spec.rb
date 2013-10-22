require 'spec_helper'

describe Admin::AttemptsController do
  let(:user){ FactoryGirl.create(:user)}
  let(:level){ FactoryGirl.create(:level)}

  describe "GET #index" do
    it "assigns an array of attempts" do
      question = level.topics.last.contents.last.questions.last
      attempt = create(:attempt,user_id: user.id, question_id: question.id )

      get :index, user_id: user.id

      page_attempts = assigns[:attempts]

      expect(attempt).to eql page_attempts
    end

    it "renders the :index view" do
      question = level.topics.last.contents.last.questions.last
      attempt = create(:attempt,user_id: user.id, question_id: question.id )

      get :index, user_id: user.id

      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested attempt to @attempt" do
      question = level.topics.last.contents.last.questions.last
      attempt = create(:attempt,user_id: user.id, question_id: question.id )

      get :show, user_id: user.id, id: attempt.id

      page_attempt = assigns[:attempt]

      expect(attempt).to eql page_attempt
    end

    it "renders the :show view" do
      question = level.topics.last.contents.last.questions.last
      attempt = create(:attempt,user_id: user.id, question_id: question.id )

      get :show, user_id: user.id, id: attempt.id

      expect(response).to render_template :show
    end
  end
end