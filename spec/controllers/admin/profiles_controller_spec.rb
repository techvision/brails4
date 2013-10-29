require 'spec_helper'

describe Admin::ProfilesController do
  login(:admin)
  let(:profile) { FactoryGirl.create(:profile)}
  let(:attrs) { FactoryGirl.attributes_for(:profile)}
  let(:invalid_attrs) { FactoryGirl.attributes_for(:profile, name: nil)}

  describe "GET #show" do
    context "when find the profile" do
      it "assigns the requested Profile to @profile" do
        get :show, user_id: profile.user_id

        page_profile = assigns[:profile]

        expect(profile).to eq page_profile
      end

      it "renders the :show template" do
        get :show, user_id: profile.user_id

        expect(response).to render_template :show
      end
    end
  end

  describe "GET #new" do
    it "assigns a new Profile to @profile" do
      get :new, user_id: profile.user_id

      page_profile = assigns[:profile]

      expect(page_profile).to_not be_nil
    end

    it "renders the :new template" do
      get :new, user_id: profile.user_id

      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    it "assigns the requested Profile to @profile" do
      get :edit, user_id: profile.user_id
      page_profile = assigns[:profile]

      expect(profile).to eq page_profile
    end

    it "renders the :edit template" do
      get :edit, user_id: profile.user_id

      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new Profile in the database" do
        expect { post :create,user_id: profile.user_id, profile: attrs}.to change(Profile,:count).by(1)
      end

      it "redirects to the :show view" do
        post :create, user_id: profile.user_id, profile: attrs

        expect(response).to redirect_to admin_profile_path(profile)
      end
    end

    context "with invalid attributes" do
      it "doesn't save the new Profile in the database" do
        post :create, user_id: profile.user_id, profile: invalid_attrs

        expect(response).to be_false
      end

      it "redirects to the :new view" do
        post :create,user_id: profile.user_id, profile: invalid_attrs

        expect(response).to redirect_to new_admin_profile_path
      end
    end
  end

  describe "PUT #update" do
    context "with valid attributes" do
      it "changes @profile attributes" do
        attributes = attributes_for(:profile, name: "New name")

        put :update, user_id: profile.user_id, profile: attributes
        profile.reload

        expect(profile.name).to eq "New name"
      end

      it "redirects to the :index view" do
        attributes = attributes_for(:profile, name: "New name")

        put :update, user_id: profile.user_id, profile: attributes

        expect(response).to redirect_to admin_profiles_path
      end
    end

    context "with invalid attributes" do
      it "doesn't changes @profile attributes" do
        put :update, user_id: profile.user_id, profile: invalid_attrs
        updated_profile = profile.reload

        expect(profile).to eq updated_profile
      end

      it "redirects to the :edit view" do
        put :update, user_id: profile.user_id, profile: invalid_attrs

        expect(response).to redirect_to edit_admin_profile_path
      end
    end
  end
end