require 'spec_helper'

describe ContentsController do
  let(:level) { create(:full_level)}
  let(:topic) { level.topics.first}
  let(:content) { topic.contents.first}

  before(:each) do
    login
  end

  describe "GET #show" do
    it "assigns the requested Content to @content" do
      get :show, id: content.id
      page_content = assigns[:content]

      expect(content).to eq page_content
    end

    it "renders the :show template" do
      topic.contents << content
      
      get :show, id: content.id

      expect(response).to render_template :show
    end
  end
end
