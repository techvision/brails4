require 'spec_helper'

describe ContentsController do
  let(:content) { FactoryGirl.create(:content) }

  describe "GET #show" do
    it "assigns the requested Content to @content" do
      get :show, id: content.id
      page_content = assigns[:content]

      expect(content).to eq page_content
    end

    it "renders the :show template" do
      get :show, id: content.id

      expect(response).to render_template :show
    end
  end

  it 'can download a mp3 audio file'
  it 'can download an ogg audio file'
end
