require 'spec_helper'

describe InvitationsController do
  
  describe "GET #new" do
    it "assigns a new feedback object" do
      get :new
      invitation = assigns[:invitation]

      expect(invitation).not_to be_nil
    end

    it "renders the :new view" do
      get :new

      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    let(:attrs) {FactoryGirl.attributes_for(:invitation)}

    it "creates a new database record" do
      expect{ put :create, invitation: attrs}.to change(Invitation,:count).by(1)
    end

    it "redirects to :show view" do
      put :create, invitation: attrs

      expect(response).to redirect_to :show
    end

    it "shows a success message" do
      put :create, invitation: attrs

      expect(flash[:notice]).to eql "Invitation successfully created"
    end
  end
end