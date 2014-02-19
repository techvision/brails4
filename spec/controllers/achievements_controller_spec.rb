require 'spec_helper'

describe AchievementsController do
  let(:level) { create(:full_level)}
  let(:topic) { level.topics.last}
  let(:achievement) { build(:achievement, profile: @user.profile, topic_id: topic.id)}

  before(:each) do
    login
    @user.profile.achievements << achievement
  end

  describe "GET #index" do
    it "assigns the achievements to @achievement" do
      get :index, user_id: @user.id

      page_achievements = assigns[:achievements].to_a

      expect(achievement.to_a).to eql page_achievements
    end

    it "renders the index view" do
      get :index, user_id: @user.id

      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested achievement to @achievement" do
      get :show, user_id: @user.id, id: achievement.id

      page_achievement = assigns[:achievement]

      expect(achievement).to eql page_achievement
    end

    it "renders the show view" do
      get :show, user_id: @user.id, id: achievement.id

      expect(response).to render_template :show
    end
  end
end
