require 'spec_helper'

describe ProfilesController do
  let(:user) {create(:user)}
  let(:profile) {create(:profile, user_id: user.id)}
  let(:attrs) {attributes_for(:profile, user_id: user.id)}
  let(:incorrect_attrs) {attributes_for(:profile, name: nil, address: nil)}
  let(:profile_attr) {attributes_for(:profile, name: "test", gender: "Male", address: "Pune", country: "India")}

  before(:each) do
    login
  end

  describe "GET #show" do
    it "assigns the current user profile to @profile" do
      get :show, user_id: @user.id
      expect(assigns[:profile]).to eq @user.profile
    end

    it "renders the :show template" do
      get :show, user_id: @user.id
      expect(response).to render_template :show
    end
  end  

  describe "GET #new" do
    context "if current user profile is nil" do
      it "assigns a new Profile to @profile" do
        get :new, user_id: @user.id
        expect(assigns[:profile]).to_not be_nil
      end
 
      it "renders the new template" do
        get :new, user_id: @user.id
        expect(response).to render_template :new
      end
    end
  end

  describe "GET #edit" do
    context "current user profile is not nil" do
      it "assigns the current user profile to @profile" do
        get :edit, user_id: @user.id
        expect(assigns[:profile]).to eq @user.profile
      end

      it "renders the edit template" do
        get :edit, user_id: @user.id
        expect(response).to render_template :edit
      end
    end
  end

  describe "POST #create" do
    context "with valid attributes" do

      it "save the new current user profile in the database" do
        expect{ post :create, user_id: @user.id, profile: profile_attr }.to change(Profile, :count).by(1)     
      end

      it "redirects to :show view" do
        post :create, user_id: @user.id, profile: profile_attr 

        expect(response).to redirect_to user_profile_path(@user)
      end
     
      it "shows a success message" do
        post :create, user_id: @user.id, profile: profile_attr

        expect(flash[:notice]).to eql "Profile successfully created."
      end
    end

    context "with invalid attributes" do
      it "doesn't changes @profile attributes" do
        expect{ post :create, user_id: @user.id, profile: incorrect_attrs }.to_not change(Profile, :count)        
      end  
      
      it "render the :new view" do
        post :create, user_id: @user.id, profile: incorrect_attrs
        
        expect(response).to render_template :new
      end
    end
  end

  describe "PUT #update" do
    context "with valid attributes" do
      it "changes @profile attributes" do
        updated_attrs = attributes_for(:profile, name: "new name")
        put :update, user_id: @user.id, profile: updated_attrs

        expect(assigns[:profile].name).to eq "new name"
      end

      it "redirects to the :show view" do
        updated_attrs = attributes_for(:profile, name: "new name")
        
        put :update, user_id: @user.id, profile: updated_attrs
        expect(response).to redirect_to user_profile_path(@user)
      end

      it "shows success message" do             
        updated_attrs = attributes_for(:profile, name: "new name")

        put :update, user_id: @user.id, profile: updated_attrs
        expect(flash[:notice]).to eql "Profile successfully updated."
      end
    end

    context "with invalid attributes" do
      it "doesn't changes @profile attributes" do
        put :update, user_id: @user.id, profile: incorrect_attrs
        
        expect(assigns[:profile]).to eq @user.profile
      end
  
      it "render :edit view" do
        put :update, user_id: @user.id, profile: incorrect_attrs

        expect(response).to render_template :edit
      end  
    end
  end
end
