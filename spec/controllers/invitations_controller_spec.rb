require 'spec_helper'

describe InvitationsController do
  login
  let(:user) { FactoryGirl.create(:user)}
  let(:attrs) { FactoryGirl.attributes_for(:invitation)}
  
  describe "GET #new" do
    it "assigns a new feedback object" do
      get :new, user_id: user.id
      invitation = assigns[:invitation]

      expect(invitation).not_to be_nil
    end

    it "renders the :new view" do
      get :new,user_id: user.id

      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    it "creates a new database record" do
      expect{ put :create,user_id: user.id, invitation: attrs}.to change{Invitation.count}.by(1)
    end

    it "redirects to :show view" do
      put :create,user_id: user.id, invitation: attrs

      expect(response).to redirect_to :show
    end

    it "shows a success message" do
      put :create,user_id: user.id, invitation: attrs

      expect(flash[:notice]).to eql "Invitation successfully created"
    end
  end
end