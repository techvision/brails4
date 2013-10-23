require 'spec_helper'

describe FeedbacksController do
  login
  let(:user) { FactoryGirl.create(:user)}
  
  describe "GET #new" do
    it "assigns a new feedback object" do
      get :new, user_id: user.id
      feedback = assigns[:feedback]

      expect(feedback).not_to be_nil
    end

    it "renders the :new view" do
      get :new, user_id: user.id

      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    let(:attrs) { FactoryGirl.attributes_for(:feedback) }

    it "creates a new database record" do
      expect{ put :create, feedback: attrs, user_id: user.id}.to change(Feedback,:count).by(1)
    end

    it "redirects to :show view" do
      put :create, feedback: attrs, user_id: user.id

      expect(response).to redirect_to :show
    end

    it "shows a success message" do
      put :create, feedback: attrs, user_id: user.id

      expect(flash[:notice]).to eql "Feedback successfully created"
    end
  end
end