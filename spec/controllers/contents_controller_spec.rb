require 'spec_helper'

describe ContentsController do
  let(:content) { FactoryGirl.create(:content) }
  let(:topic) {FactoryGirl.create(:topic)}

  describe "GET #show" do
    it "assigns the requested Content to @content" do
      topic.contents << content

      get :show, id: content.id, topic_id: topic.id
      page_content = assigns[:content]

      expect(content).to eq page_content
    end

    it "renders the :show template" do
      topic.contents << content
      
      get :show, id: content.id, topic_id: topic.id

      expect(response).to render_template :show
    end
  end

  it 'can download a mp3 audio file'
  it 'can download an ogg audio file'
end