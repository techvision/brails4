require 'spec_helper'

describe Admin::TopicsController do
  login(:admin)
  let (:level) { FactoryGirl.create(:level) }
  let(:topic) { level.topics.first}
  let(:topics) { level.topics}
  let(:attrs) {FactoryGirl.attributes_for(:topic)}
  let(:invalid_attrs) {FactoryGirl.attributes_for(:topic, title: nil)}

  it_behaves_like "Commentable"
  it_behaves_like "Questionable"

  describe "GET #index" do
    it "populates an array of topics" do
      get :index, level_id: level.id

      page_topics = assigns[:topics]

      expect(topics).to eq page_topics
    end

    it "renders the :index view" do
      get :index, level_id: level.id

      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    context "when find the topic" do
      it "assigns the requested Topic to @topic" do
        get :show, id: topic.id, level_id: level.id
        page_topic = assigns[:topic]

        expect(topic).to eq page_topic
      end

      it "renders the :show template" do
        get :show, id: topic.id, level_id: level.id

        expect(response).to render_template :show
      end
    end

    context "when can not find the topic" do
      it "shows an error message" do
        get :show, id: "test", level_id: level.id

        expect(flash[:error]).to eq "Could not find the specified Topic"
      end

      it "redirects to index page" do
        get :show, id: "test", level_id: level.id

        expect(response).to redirect_to :index
      end
    end
  end

  describe "GET #new" do
    it "assigns a new Topic to @topic" do
      get :new, level_id: level.id
      page_topic = assigns[:topic]

      expect(page_topic).to_not be_nil
    end

    it "renders the :new template" do
      get :new, level_id: level.id

      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    it "assigns the requested Topic to @topic" do
      get :edit, id: topic.id, level_id: level.id
      page_topic = assigns[:topic]

      expect(topic).to eq page_topic
    end

    it "renders the :edit template" do
      get :edit, id: topic.id, level_id: level.id

      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new Topic in the database" do
        expect { post :create, level_id: level.id, topic: attrs}.to change(Topic,:count).by(1)
      end

      it "redirects to the :show view" do
        post :create, topic: attrs, level_id: level.id

        expect(response).to redirect_to :show
      end
    end

    context "with invalid attributes" do
      it "doesn't save the new Topic in the database" do
        expect {post :create, topic: invalid_attrs, level_id: level.id}.to_not change(Topic,:count)
      end

      it "redirects to the :new view" do
        post :create, topic: invalid_attrs, level_id: level.id

        expect(response).to redirect_to :new
      end
    end
  end

  describe "PUT #update" do
    context "with valid attributes" do
      it "changes @topic attributes" do
        attributes = attributes_for(:topic, title: "New title")

        put :update, id: topic.id, level_id: level.id, topic: attrs
        topic.reload

        expect(topic.title).to eq "New title"
      end

      it "redirects to the :index view" do
        put :update, id: topic.id, level_id: level.id, topic: attrs

        expect(response).to redirect_to :index
      end
    end

    context "with invalid attributes" do
      it "doesn't changes @topic attributes" do
        put :update, id: topic.id, level_id: level.id,topic: invalid_attrs
        updated_topic = assigns[:topic]

        expect(topic).to eq updated_topic
      end

      it "redirects to the :edit view" do
        put :update, id: topic.id, level_id: level.id, topic: invalid_attrs

        expect(response).to redirect_to :edit
      end
    end
  end

  describe "DELETE #destroy" do
    it "deletes the topic" do
      expect {delete :destroy, id: topic.id, level_id: level.id}.to change(Topic,:count).by(-1)
    end

    it "redirects to the :index view" do
      delete :destroy, id: topic.id, level_id: level.id

      expect(response).to redirect_to :index
    end
  end
end