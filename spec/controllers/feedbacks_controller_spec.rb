require 'spec_helper'

describe FeedbacksController do
  
  describe "GET #new" do
    it "assigns a new feedback object" do
      get :new
      feedback = assigns[:feedback]

      expect(feedback).not_to be_nil
    end

    it "renders the :new view" do
      get :new

      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    let(:attrs) { FactoryGirl.attributes_for(:feedback) }

    it "creates a new database record" do
      expect{ put :create, feedback: attrs}.to change(Feedback,:count).by(1)
    end

    it "redirects to :show view" do
      put :create, feedback: attrs

      expect(response).to redirect_to :show
    end

    it "shows a success message" do
      put :create, feedback: attrs

      expect(flash[:notice]).to eql "Feedback successfully created"
    end
  end
end