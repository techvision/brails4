require 'spec_helper'

describe LevelsController do 
  before(:each) do
    let(:user) { FactoryGirl.create(:user) } 
    let(:level) { FactoryGirl.create(:level) }
    let(:question) { FactoryGirl.create(:question) }
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