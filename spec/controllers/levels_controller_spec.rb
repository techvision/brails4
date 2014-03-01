require 'spec_helper'

describe LevelsController do 
  let(:level) { create(:full_level) }

  before(:each) do
    login
  end

  describe "GET #index" do
    it "assigns the level to @levels" do
      get :index
      levels = assigns[:levels]
      expect(levels).to include(level)
    end

    it "renders the index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested Level to @level" do
      get :show, id: level.id
      page_level = assigns[:level]

      expect(level).to eql page_level
    end

    it "renders the :show template" do
      get :show, id: level.id

      expect(response).to render_template :show
    end
  end
end
