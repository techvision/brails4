require 'spec_helper'

describe Admin::TopicsController do
  login(:admin)
  let (:level) { create(:full_level) }
  let! (:topic) { level.topics.first}
  let (:attrs) { attributes_for(:topic)}
  let (:invalid_attrs) { attributes_for(:topic, title: nil)}

  describe "GET #index" do
    it "populates an array of topics" do
      get :index, level_id: level.id

      page_topics = assigns[:topics]

      expect(page_topics).to include(topic)
    end

    it "renders the :index view" do
      get :index, level_id: level.id

      expect(response).to render_template :index 
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

      it "redirects to the parent level view" do
        post :create, topic: attrs, level_id: level.id

        expect(response).to redirect_to admin_level_path(level)
      end
    end

    context "with invalid attributes" do
      it "doesn't save the new Topic in the database" do
        expect {post :create, topic: invalid_attrs, level_id: level.id}.to_not change(Topic,:count)
      end

      it "redirects to the :new view" do
        post :create, topic: invalid_attrs, level_id: level.id

        expect(response).to render_template :new
      end
    end
  end

  describe "PUT #update" do
    context "with valid attributes" do
      it "changes @topic attributes" do
        attributes = attributes_for(:topic, title: "New title")

        put :update, id: topic.id, level_id: level.id, topic: attributes
        topic.reload

        expect(topic.title).to eq "New title"
      end

      it "redirects to the :show view" do
        attributes = attributes_for(:topic, title: "New title")

        put :update, id: topic.id, level_id: level.id, topic: attributes

        expect(response).to redirect_to admin_topic_path(topic)
      end
    end

    context "with invalid attributes" do
      it "doesn't changes @topic attributes" do
        put :update, id: topic.id, level_id: level.id, topic: invalid_attrs
        updated_topic = assigns[:topic]

        expect(topic).to eq updated_topic
      end

      it "redirects to the :edit view" do
        put :update, id: topic.id, level_id: level.id, topic: invalid_attrs

        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    it "deletes the topic" do
      expect {delete :destroy, id: topic.id, level_id: level.id}.to change(Topic,:count).by(-1)
    end

    it "redirects to the :index view" do
      delete :destroy, id: topic.id, level_id: level.id

      expect(response).to redirect_to admin_level_path(level)
    end
  end
end