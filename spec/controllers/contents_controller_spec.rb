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

  it 'can download a mp3 audio file' do
    get :download_mp3, id: content.id

    expect(response).to be_success
  end

  it 'can download an ogg audio file' do
    get :download_ogg, id: content.id

    expect(response).to be_success
  end
end