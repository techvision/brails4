require 'spec_helper'

describe TopicsController do
  let(:level)  { create(:full_level)}
  let(:topic1) { level.topics.first}
  let(:topic2) { build(:topic,seq_number: 2)}
  let(:achievement) { build(:achievement, profile: @user.profile, topic_id: topic1.id)}

  before(:each) do
    login
    level.topics << topic2
  end

  describe "GET #show" do
    context "when user finished previous topics" do
      it "assigns the requested Topic to @topic" do
        @user.profile.achievements << achievement

        get :show, id: topic2.id, level_id: level.id
        page_topic = assigns[:topic]

        expect(topic).to be eql page_topic
      end

      it "renders the :show template" do
        @user.profile.achievements << achievement

        get :show, id: topic2.id, level_id: level.id

        expect(response).to render_template :show
      end
    end

    context "when @user did not finished previous topics" do
      it "redirects to :index view" do
        get :show, id: topic2.id, level_id: level.id

        expect(response).to redirect_to :index
      end

      it "shows an alert message" do
        get :show, id: topic2.id, level_id: level.id

        expect(flash[:error]).to eql "You can not access this topic yet"
      end
    end
  end
end