require 'spec_helper'

describe Admin::ContentsController do
  login(:admin)
  let(:topic) { FactoryGirl.create(:topic) }
  let(:content) { FactoryGirl.create(:content)}
  let(:attrs) {FactoryGirl.attributes_for(:content)}
  let(:invalid_attrs) {FactoryGirl.attributes_for(:content, title: nil)}

  it "can upload a mp3 audio file"
  it "can upload a ogg audio file"

  describe "GET #index" do
    it "populates an array of contents" do
      topic.contents << content

      get :index, topic_id: topic.id
      page_contents = assigns[:contents]

      expect(contents).to eq page_contents
    end

    it "renders the :index view" do
      topic.contents << content

      get :index, topic_id: topic.id

      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    context "when find the content" do
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

    context "when can not find the content" do
      it "shows an error message" do
        get :show, id: "test", topic_id: topic.id

        expect(flash[:error]).to eq "Could not find the specified Content"
      end

      it "redirects to index page" do
        get :show, id: "test", topic_id: topic.id

        expect(response).to redirect_to :index
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
      topic.contents << content

      get :edit, id: content.id, topic_id: topic.id
      page_content = assigns[:content]

      expect(content).to eq page_content
    end

    it "renders the :edit template" do
      topic.contents << content

      get :edit, id: content.id, topic_id: topic.id

      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new Content in the database" do
        expect { post :create, topic_id: topic.id, content: attrs}.to change(Content,:count).by(1)
      end

      it "redirects to the :show view" do
        post :create, topic_id: topic.id, content: attrs

        expect(response).to redirect_to :show
      end
    end

    context "with invalid attributes" do
      it "doesn't save the new Content in the database" do
        post :create, content: invalid_attrs, topic_id: topic.id

        expect(Content.count).to_not change
      end

      it "redirects to the :new view" do
        post :create, content: invalid_attrs, topic_id: topic.id

        expect(response).to redirect_to :new
      end
    end
  end

  describe "PUT #update" do
    context "with valid attributes" do
      it "changes @content attributes" do
        topic.contents << content
        attributes = attributes_for(:content, title: "New title")

        put :update, id: content.id, topic_id: topic.id, content: attributes
        content.reload

        expect(content.title).to eq "New title"
      end

      it "redirects to the :index view" do
        attributes = attributes_for(:content, title: "New title")
        put :update, id: content.id,topic_id: topic.id, content: attributes

        expect(response).to redirect_to :index
      end
    end

    context "with invalid attributes" do
      it "doesn't changes @content attributes" do
        topic.contents << content

        put :update, id: content.id, topic_id: topic.id, content: invalid_attrs
        updated_content = content.reload

        expect(content).to eq updated_content
      end

      it "redirects to the :edit view" do
        topic.contents << content

        put :update, id: content.id, topic_id: topic.id, content: invalid_attrs

        expect(response).to redirect_to :edit
      end
    end
  end

  describe "DELETE #destroy" do
    it "deletes the content" do
      topic.contents << content

      delete :destroy, id: content.id, topic_id: topic.id

      expect(Content.count).to eq 0
    end

    it "redirects to the :index view" do
      topic.contents << content

      delete :destroy, id: content.id, topic_id: topic.id

      expect(response).to redirect_to :index
    end
  end
end