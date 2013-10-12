require 'spec_helper'

describe Admin::InvitationsController do

  describe "GET #show" do
    before(:each) do
      let(:invitation) { FactoryGirl.create(:invitation) }
    end

    it "assigns the requested Invitation to @invitation" do
      get :show, id: invitation.id
      page_invitation = assigns[:invitation]

      expect(invitation).to eql page_invitation
    end

    it "renders the :show view" do
      get :show, id: invitation.id

      expect(response).to render_template :show
    end
  end

  describe "GET #edit" do
    it "assigns the requested Invitation to @invitation" do
      get :edit, id: invitation.id
      page_invitation = assigns[:invitation]

      expect(invitation).to eql page_invitation
    end

    it "renders the edit view" do
      get :show, id: invitation.id

      expect(response).to render_template :show
    end
  end

  describe "PUT #update" do
    it "changes @invitation attributes" do
      attrs = attributes_for(:invitation, text: "Updated text")

      put :update, id: invitation.id, invitation: attrs
      invitation.reload

      expect(invitation.text).to eql "Updated text"
    end


    it "redirects to :show view" do
      attrs = attributes_for(:invitation, text: "Updated text")

      put :update, id: invitation.id, invitation: attrs

      expect(response).to redirect_to :show
    end
  end

  describe "DELETE #destroy" do
    it "deletes the assigned record" do
      expect{delete :destroy, id: invitation.id}.to change(Invitation,:count).by(-1)
    end

    it "redirects to :index view" do
      delete :destroy, id: invitation.id
      expect(response).to redirect_to :index
    end
  end
end