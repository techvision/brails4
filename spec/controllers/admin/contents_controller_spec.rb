require 'spec_helper'

describe Admin::ContentsController do
  login(:admin)
  let(:topic) { create(:full_topic) }
  let!(:content) { topic.contents.first }
  let(:attrs) { attributes_for(:full_content)}
  let(:invalid_attrs) { attributes_for(:content, title: nil)}

  it "can upload a mp3 audio file"
  it "can upload a ogg audio file"

  describe "GET #index" do
    it "populates an array of contents" do
      get :index, topic_id: topic.id
      page_contents = assigns[:contents]

      expect(page_contents).to include(content)
    end

    it "renders the :index view" do
      get :index, topic_id: topic.id

      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    context "when find the content" do
      it "assigns the requested Content to @content" do
        get :show, id: content.id, topic_id: topic.id
        page_content = assigns[:content]

        expect(content).to eq page_content
      end

      it "renders the :show template" do
        get :show, id: content.id, topic_id: topic.id

        expect(response).to render_template :show
      end
    end
  end

  describe "GET #new" do
    it "assigns a new Content to @content" do
      get :new, topic_id: topic.id
      page_content = assigns[:content]

      expect(page_content).to_not be_nil
    end

    it "renders the :new template" do
      get :new, topic_id: topic.id

      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    it "assigns the requested Content to @content" do
      get :edit, id: content.id, topic_id: topic.id
      page_content = assigns[:content]

      expect(content).to eq page_content
    end

    it "renders the :edit template" do
      get :edit, id: content.id, topic_id: topic.id

      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new Content in the database" do
        expect { post :create, topic_id: topic.id, content: attrs}.to change(Content,:count).by(1)
      end

      it "redirects to the topic :show view" do
        post :create, topic_id: topic.id, content: attrs

        expect(response).to redirect_to admin_topic_path(topic)
      end
    end

    context "with invalid attributes" do
      it "doesn't save the new Content in the database" do
        expect{post :create, content: invalid_attrs, topic_id: topic.id}.to_not change(Content,:count)
      end

      it "redirects to the :new view" do
        post :create, content: invalid_attrs, topic_id: topic.id

        expect(response).to render_template :new
      end
    end
  end

  describe "PUT #update" do
    context "with valid attributes" do
      it "changes @content attributes" do
        attributes = attributes_for(:content, title: "New title")

        put :update, id: content.id, topic_id: topic.id, content: attributes
        content.reload

        expect(content.title).to eq "New title"
      end

      it "redirects to the :show view" do
        attributes = attributes_for(:content, title: "New title")
        put :update, id: content.id,topic_id: topic.id, content: attributes

        expect(response).to redirect_to admin_content_path
      end
    end

    context "with invalid attributes" do
      it "doesn't changes @content attributes" do
        put :update, id: content.id, topic_id: topic.id, content: invalid_attrs
        updated_content = content.reload

        expect(content).to eq updated_content
      end

      it "redirects to the :edit view" do
        put :update, id: content.id, topic_id: topic.id, content: invalid_attrs

        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    it "deletes the content" do
      expect{delete :destroy, id: content.id, topic_id: topic.id}.to change(Content,:count).by(-1)
    end

    it "redirects to the :index view" do
      delete :destroy, id: content.id, topic_id: topic.id

      expect(response).to redirect_to admin_topic_path(topic)
    end
  end
end