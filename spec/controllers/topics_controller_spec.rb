require 'spec_helper'

describe TopicsController do
  let(:user){ FactoryGirl.create(:user)}

  describe "GET #show" do
    context "when user finished previous topics" do
      it "assigns the requested Topic to @topic" do
        topic = create(:topic)
        achievement = create(:achievement, user_id: user.id, topic_id: topic.id)

        level.topics << topic
        user.profile.achievements << achievement

        get :show, id: topic.id
        page_topic = assigns[:topic]

        expect(topic).to be eql page_topic
      end

      it "renders the :show template" do
        topic = create(:topic)
        achievement = create(:achievement, user_id: user.id, topic_id: topic.id)

        user.profile.achievements << achievement

        get :show, id: topic.id

        expect(response).to render_template :show
      end
    end

    context "when user did not finished previous topics" do
      it "redirects to :index view" do
        topic = create(:topic)
        get :show, id: topic.id

        expect(response).to redirect_to :index
      end

      it "shows an alert message" do
        topic = create(:topic)
        get :show, id: topic.id

        expect(flash[:error]).to eql "You can not access this topic yet"
      end
    end
  end
end