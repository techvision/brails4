require 'spec_helper'

describe FeedbacksController do

  before(:each) do
    login
  end
  
  describe "GET #new" do
    it "assigns a new feedback object" do
      get :new, user_id: @user.id
      feedback = assigns[:feedback]

      expect(feedback).not_to be_nil
    end

    it "renders the :new view" do
      get :new, user_id: @user.id

      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    let(:attrs) { attributes_for(:feedback) }

    it "creates a new database record" do
      expect{ post :create, feedback: attrs, user_id: @user.id}.to change(Feedback,:count).by(1)
    end

    it "redirects to :show view" do
      post :create, feedback: attrs, user_id: @user.id

      expect(response).to redirect_to user_path(@user)
    end

    it "shows a success message" do
      post :create, feedback: attrs, user_id: @user.id

      expect(flash[:notice]).to eql "Feedback successfully created"
    end
  end
end
