require 'spec_helper'

describe TopicsController do
  let(:level) { FactoryGirl.create(:level)}
  let(:user) { FactoryGirl.create(:user)}
  let(:topic1) { FactoryGirl.create(:topic,seq_number: 1)}
  let(:topic2) { FactoryGirl.create(:topic,seq_number: 2)}

  describe "GET #show" do
    context "when user finished previous topics" do
      it "assigns the requested Topic to @topic" do
        achievement = build(:achievement, user_id: user.id, topic_id: topic1.id)
        user.profile.achievements << achievement

        level.topics << topic1
        level.topics << topic2
        user.profile.achievements << achievement

        get :show, id: topic2.id, level_id: level.id
        page_topic = assigns[:topic]

        expect(topic).to be eql page_topic
      end

      it "renders the :show template" do
        achievement = build(:achievement, user_id: user.id, topic_id: topic1.id)
        user.profile.achievements << achievement
        
        level.topics << topic1
        level.topics << topic2
        user.profile.achievements << achievement

        get :show, id: topic2.id, level_id: level.id

        expect(response).to render_template :show
      end
    end

    context "when user did not finished previous topics" do
      it "redirects to :index view" do
        level.topics << topic1
        level.topics << topic2
        get :show, id: topic2.id, level_id: level.id

        expect(response).to redirect_to :index
      end

      it "shows an alert message" do
        level.topics << topic1
        level.topics << topic2
        get :show, id: topic2.id, level_id: level.id

        expect(flash[:error]).to eql "You can not access this topic yet"
      end
    end
  end
end