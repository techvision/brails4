require 'spec_helper'

describe UsersController do
  let(:attrs) { attributes_for(:user, email: "updated@email.com")}
  let(:incorrect_attrs) { attributes_for(:user, email: nil)}

  before(:each) do
    login
  end

  describe "GET #show" do
    it "assigns the current user to @user" do
      get :show, id: @user.id
      page_user = assigns[:user]

      expect(@user).to eql page_user
    end

    it "renders the :show view" do
      get :show, id: @user.id

      expect(response).to render_template :show
    end
  end
  
  describe "GET #edit" do
    it "assigns the current user to @user" do
      get :edit, id: @user.id

      page_user = assigns[:user]

      expect(@user).to eql page_user
    end

    it "renders the :edit view" do
      get :edit, id: @user.id

      expect(response).to render_template :edit
    end
  end

  describe "PUT #update" do
    context "when attributes are valid" do
      it "updates the user data" do
        put :update, id: @user.id, user: attrs
        @user.reload
        expect(@user.email).to eq "updated@email.com"
      end

      it "shows a success message" do
        put :update, id: @user.id, user: attrs

        expect(flash[:notice]).to eql "User successfully updated"
      end

      it "redirects to :show view" do
        put :update, id: @user.id, user: attrs

        expect(response).to redirect_to user_path(assigns[:user])
      end
    end

    context "when attributes are invalid" do
      it "do not update the user data" do
        expect{put :update, id: @user.id, user: incorrect_attrs}.to_not change{@user.email }
      end

      it "shows a error message" do
        put :update, id: @user.id, user: incorrect_attrs

        expect(flash[:alert]).to eql "User could not be updated"
      end

      it "redirects to the :edit page" do
        put :update, id: @user.id, user: incorrect_attrs

        expect(response).to render_template :edit
      end
    end
  end
end
