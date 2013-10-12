require 'spec_helper'

describe Admin::TopicsController do

  before(:each) do
    let (:level) { FactoryGirl.create(:level) }
  end

  describe "GET #index" do
    it "populates an array of topics" do
      topics = 2.times {create(:topic)}

      level.topics << topics

      get :index, level_id: level.id

      page_topics = assigns[:topics]

      expect(topics).to eq page_topics
    end

    it "renders the :index view" do
      level.topics << topics

      get :index, level_id: level.id

      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    context "when find the topic" do
      it "assigns the requested Topic to @topic" do
        topic = create(:topic)
        level.topics << topics

        get :show, id: topic.id, level_id: level.id
        page_topic = assigns[:topic]

        expect(topic).to eq page_topic
      end

      it "renders the :show template" do
        topic = create(:topic)
        level.topics << topics

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
      topic = assigns[:topic]

      expect(topic).to_not be_nil
    end

    it "renders the :new template" do
      get :new, level_id: level.id

      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    it "assigns the requested Topic to @topic" do
      topic = create(:topic)
      level.topics << topic

      get :edit, id: topic.id, level_id: level.id
      page_topic = assigns[:topic]

      expect(topic).to eq page_topic
    end

    it "renders the :edit template" do
      topic = create(:topic)
      level.topics << topic

      get :edit, id: topic.id, level_id: level.id

      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      before do
        let(:attrs) {FactoryGirl.attributes_for(:topic)}
      end

      it "saves the new Topic in the database" do
        expect { post :create, level_id: level.id, topic: attrs}.to change(Topic,:count).by(1)
      end

      it "redirects to the :show view" do
        post :create, topic: attrs, level_id: level.id

        expect(response).to redirect_to :show
      end
    end

    context "with invalid attributes" do
      before do
        let(:attrs) {FactoryGirl.attributes_for(:topic, title: nil)}
      end

      it "doesn't save the new Topic in the database" do
        expect {post :create, topic: attrs, level_id: level.id}.to_not change(Topic,:count)
      end

      it "redirects to the :new view" do
        post :create, topic: attrs, level_id: level.id

        expect(response).to redirect_to :new
      end
    end
  end

  describe "PUT #update" do
    context "with valid attributes" do
      it "changes @topic attributes" do
        topic = create(:topic)
        level.topics << topic
        attrs = attributes_for(:topic, title: "New title")

        put :update, id: topic.id, level_id: level.id, topic: attrs
        topic.reload

        expect(topic.title).to eq "New title"
      end

      it "redirects to the :index view" do
        topic = create(:topic)
        level.topics << topic
        attrs = attributes_for(:topic)

        put :update, id: topic.id, level_id: level.id, topic: attrs

        expect(response).to redirect_to :index
      end
    end

    context "with invalid attributes" do
      it "doesn't changes @topic attributes" do
        topic = create(:topic)
        level.topics << topic
        attrs = attributes_for(:topic, title: nil)

        put :update, id: topic.id, level_id: level.id,topic: attrs
        updated_topic = assigns[:topic]

        expect(topic).to eq updated_topic
      end

      it "redirects to the :edit view" do
        topic = create(:topic)
        level.topics << topic
        attrs = attributes_for(:topic, title: nil)

        put :update, id: topic.id, level_id: level.id, topic: attrs

        expect(response).to redirect_to :edit
      end
    end
  end

  describe "DELETE #destroy" do
    it "deletes the topic" do
      topic = create(:topic)
      level.topics << topic

      expect {delete :destroy, id: topic.id, level_id: level.id}.to change(Topic,:count).by(-1)
    end

    it "redirects to the :index view" do
      topic  = create(:topic)
      level.topics << topic

      delete :destroy, id: topic.id, level_id: level.id

      expect(response).to redirect_to :index
    end
  end
end