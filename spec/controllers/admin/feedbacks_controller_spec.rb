require 'spec_helper'

describe Admin::FeedbacksController do
  before(:each) do
    let(:feedback) {FactoryGirl.create(:feedback)}
  end

  describe "GET #index" do
    it "assigns a list of feedbacks to @feedbacks" do
      get :index
      page_feedbacks = assigns[:feedbacks]

      expect(feedback).to eql page_feedbacks
    end

    it "renders the :index view" do
       get :index
       expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested feedback to @feedback" do
      get :show, id: feedback.id
      page_feedbacks = assigns[:feedback]

      expect(feedback).to eql page_feedbacks
    end

    it "renders the :show view" do
      get :show, id: feedback.id

      expect(response).to render_template :show
    end
  end
end