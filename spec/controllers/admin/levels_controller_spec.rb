require 'spec_helper'

describe Admin::LevelsController do
  login(:admin)

  let(:level) { FactoryGirl.create(:level)}
  let(:attrs) { FactoryGirl.attributes_for(:level)}
  let(:invalid_attrs) { FactoryGirl.attributes_for(:level, title: nil)}

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
        get :show, id: level.id
        page_level = assigns[:level]

        expect(level).to eq page_level
      end

      it "renders the :show template" do
        get :show, id: level.id

        expect(response).to render_template :show
      end
    end
  end

  describe "GET #new" do
    it "assigns a new Level to @level" do
      get :new
      page_level = assigns[:level]

      expect(page_level).to_not be_nil
    end

    it "renders the :new template" do
      get :new

      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    it "assigns the requested Level to @level" do
      get :edit, id: level.id
      page_level = assigns[:level]

      expect(level).to eq page_level
    end

    it "renders the :edit template" do
      get :edit, id: level.id

      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new Level in the database" do
        expect { post :create, level: attrs}.to change(Level,:count).by(1)
      end

      it "redirects to the :show view" do
        post :create, level: attrs

        expect(response).to redirect_to admin_level_path
      end
    end

    context "with invalid attributes" do
      it "doesn't save the new Level in the database" do
        post :create, level: invalid_attrs

        expect(Level.count).to_not change
      end

      it "render the :new view" do
        post :create, level: invalid_attrs

        expect(response).to render_template :new
      end
    end
  end

  describe "PUT #update" do
    context "with valid attributes" do
      it "changes @level attributes" do
        attributes = attributes_for(:level, name: "New title")

        put :update, id: level.id, level: attributes
        level.reload

        expect(level.name).to eq "New title"
      end

      it "redirects to the :show view" do
        attributes = attributes_for(:level, name: "New title")

        put :update, id: level.id, level: attributes

        expect(response).to redirect_to admin_level_path
      end
    end

    context "with invalid attributes" do
      it "doesn't changes @level attributes" do
        attributes = attributes_for(:level, name: nil)

        put :update, id: level.id, level: attrs
        updated_level = level.reload

        expect(level).to eq updated_level
      end

      it "renders the :edit view" do
        attributes = attributes_for(:level, name: nil)

        put :update, id: level.id, level: attrs

        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    it "deletes the level" do
      expect { delete :destroy, id: level.id}.to change(Level,:count).by(-1)
    end

    it "redirects to the :index view" do
      delete :destroy, id: level.id

      expect(response).to redirect_to admin_levels_path
    end
  end
end