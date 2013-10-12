require 'spec_helper'

describe Admin::LevelsController do

  describe "GET #index" do
    it "populates an array of levels" do
      levels = 2.times {create(:level)}

      get :index
      page_levels = assigns[:levels]

      expect(levels).to eq page_levels
    end

    it "renders the :index view" do
      get :index

      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    context "when find the level" do
      it "assigns the requested Level to @level" do
        level = create(:level)

        get :show, id: level.id
        page_level = assigns[:level]

        expect(level).to eq page_level
      end

      it "renders the :show template" do
        level = create(:level)

        get :show, id: level.id

        expect(response).to render_template :show
      end
    end

    context "when can not find the level" do
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
    it "assigns a new Level to @level" do
      get :new
      level = assigns[:level]

      expect(level).to_not be_nil
    end

    it "renders the :new template" do
      get :new

      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    it "assigns the requested Level to @level" do
      level = create(:level)

      get :edit, id: level.id
      page_level = assigns[:level]

      expect(level).to eq page_level
    end

    it "renders the :edit template" do
      level = create(:level)

      get :edit, id: level.id

      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      before(:each) do
        let(:attrs) {FactoryGirl.attributes_for(:level)}
      end

      it "saves the new Level in the database" do
        expect { post :create, level: attrs}.to change(Level,:count).by(1)
      end

      it "redirects to the :show view" do
        post :create, level: attrs

        expect(response).to redirect_to :show
      end
    end

    context "with invalid attributes" do
      before(:each) do
        let(:attrs) {FactoryGirl.attributes_for(:level, title: nil)}
      end

      it "doesn't save the new Level in the database" do
        post :create, level: attrs

        expect(Level.count).to_not change
      end

      it "redirects to the :new view" do
        post :create, level: attrs

        expect(response).to redirect_to :new
      end
    end
  end

  describe "PUT #update" do
    context "with valid attributes" do
      it "changes @level attributes" do
        level = create(:level)
        attrs = attributes_for(:level, title: "New title")

        put :update, id: level.id, level: attrs
        level.reload

        expect(level.title).to eq "New title"
      end

      it "redirects to the :index view" do
        level = create(:level)
        attrs = attributes_for(:level, title: "New title")

        put :update, id: level.id, level: attrs

        expect(response).to redirect_to :index
      end
    end

    context "with invalid attributes" do
      it "doesn't changes @level attributes" do
        level = create(:level)
        attrs = attributes_for(:level, title: nil)

        put :update, id: level.id, level: attrs
        updated_level = level.reload

        expect(level).to eq updated_level
      end

      it "redirects to the :edit view" do
        level = create(:level)
        attrs = attributes_for(:level, title: nil)

        put :update, id: level.id, level: attrs

        expect(response).to redirect_to :edit
      end
    end
  end

  describe "DELETE #destroy" do
    it "deletes the level" do
      level = create(:level)

      expect { delete :destroy, id: level.id}.to change(Level.count).by(-1)
    end

    it "redirects to the :index view" do
      level  = create(:level)

      delete :destroy, id: level.id

      expect(response).to redirect_to :index
    end
  end
end