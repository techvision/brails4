require 'spec_helper'

describe AchievementsController do
  login
  let(:user) { FactoryGirl.create(:user)}
  let(:level) { FactoryGirl.create(:level)}
  let(:topic) { level.topics.last}
  let(:achievement) { FactoryGirl.build(:achievement, user_id: user.id, topic_id: topic.id)}

  before(:each) do
    user.profile.achievements << achievement
  end

  describe "GET #index" do
    it "assigns the achievements to @achievement" do
      get :index, user_id: user.id

      page_achievements = assigns[:achievements]

      expect(achievement).to eql page_achievements
    end

    it "renders the index view" do
      get :index, user_id: user.id

      expect(reponse).to render_template :index
    end

    it "can see only current user achievements"
  end

  describe "GET #show" do
    it "assigns the requested achievement to @achievement" do
      get :show, user_id: user.id, id: achievement.id

      page_achievement = assigns[:achievement]

      expect(achievements).to eql page_achievement
    end

    it "renders the show view" do
      get :show, user_id: user.id, id: achievement.id

      expect(response).to render_template :show
    end
  end
end