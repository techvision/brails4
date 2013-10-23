require 'spec_helper'

describe Admin::UsersController do
  login(:admin)
  
  describe "GET #index" do
    it "populates an array of users" do
      users = 2.times {create(:user)}

      get :index
      page_users = assigns[:users]

      expect(users).to eq page_users
    end

    it "renders the :index view" do
      get :index

      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    context "when find the user" do
      it "assigns the requested Level to @user" do
        user = create(:user)

        get :show, id: user.id
        page_user = assigns[:user]

        expect(user).to eq page_user
      end

      it "renders the :show template" do
        user = create(:user)

        get :show, id: user.id

        expect(response).to render_template :show
      end
    end

    context "when can not find the user" do
      it "shows an error message" do
        get :show, id: "test"

        expect(flash[:error]).to eq "Could not find the specified Level"
      end

      it "redirects to index page" do
        get :show, id: "test"

        expect(response).to redirect_to :index
      end
    end
  end

  describe "GET #new" do
    it "assigns a new Level to @user" do
      get :new
      user = assigns[:user]

      expect(user).to_not be_nil
    end

    it "renders the :new template" do
      get :new

      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    it "assigns the requested Level to @user" do
      user = create(:user)

      get :edit, id: user.id
      page_user = assigns[:user]

      expect(user).to eq page_user
    end

    it "renders the :edit template" do
      user = create(:user)

      get :edit, id: user.id

      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      let(:attrs) {FactoryGirl.attributes_for(:user)}

      it "saves the new Level in the database" do
        expect { post :create, user: attrs}.to change(Level,:count).by(1)
      end

      it "redirects to the :show view" do
        post :create, user: attrs

        expect(response).to redirect_to :show
      end
    end

    context "with invalid attributes" do
      let(:attrs) {FactoryGirl.attributes_for(:user, title: nil)}

      it "doesn't save the new Level in the database" do
        post :create, user: attrs

        expect(Level.count).to_not change
      end

      it "redirects to the :new view" do
        post :create, user: attrs

        expect(response).to redirect_to :new
      end
    end
  end

  describe "PUT #update" do
    context "with valid attributes" do
      it "changes @user attributes" do
        user = create(:user)
        attrs = attributes_for(:user, title: "New title")

        put :update, id: user.id, user: attrs
        user.reload

        expect(user.title).to eq "New title"
      end

      it "redirects to the :index view" do
        user = create(:user)
        attrs = attributes_for(:user, title: "New title")

        put :update, id: user.id, user: attrs

        expect(response).to redirect_to :index
      end
    end

    context "with invalid attributes" do
      it "doesn't changes @user attributes" do
        user = create(:user)
        attrs = attributes_for(:user, title: nil)

        put :update, id: user.id, user: attrs
        updated_user = user.reload

        expect(user).to eq updated_user
      end

      it "redirects to the :edit view" do
        user = create(:user)
        attrs = attributes_for(:user, title: nil)

        put :update, id: user.id, user: attrs

        expect(response).to redirect_to :edit
      end
    end
  end

  describe "DELETE #destroy" do
    it "deletes the user" do
      user = create(:user)

      expect { delete :destroy, id: user.id}.to change(Level.count).by(-1)
    end

    it "redirects to the :index view" do
      user  = create(:user)

      delete :destroy, id: user.id

      expect(response).to redirect_to :index
    end
  end
end