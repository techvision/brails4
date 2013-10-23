require 'spec_helper'

describe Admin::FeedbacksController do
  login(:admin)
  let(:feedback) {FactoryGirl.create(:feedback)}
  let(:user) { FactoryGirl.create(:user)}

  describe "GET #index" do
    it "assigns a list of feedbacks to @feedbacks" do
      get :index, user_id: user.id
      page_feedbacks = assigns[:feedbacks]

      expect(feedback).to eql page_feedbacks
    end

    it "renders the :index view" do
       get :index, user_id: user.id
       expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested feedback to @feedback" do
      get :show, id: feedback.id, user_id: user.id
      page_feedbacks = assigns[:feedback]

      expect(feedback).to eql page_feedbacks
    end

    it "renders the :show view" do
      get :show, id: feedback.id, user_id: user.id

      expect(response).to render_template :show
    end
  end
end