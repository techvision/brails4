require 'spec_helper'

describe Admin::AchievementsController do
  login(:admin)
  let (:user) { create(:user)}
  let (:topic) { create(:topic)}
  let(:achievement) { build(:achievement, topic_id: topic.id, user_id: user.id)}

  describe "GET #index" do
    it "populates an array of achievements" do
      user.profile.achievements << achievements

      get :index, user_id: user.id

      page_achievements = assigns[:achievements]

      expect(achievements).to eql page_achievements
    end

    it "renders the :index view" do
      user.profile.achievements << achievements
      
      get :index, user_id: user.id

      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested achievement to @achievement" do
      user.profile.achievements << achievement

      get :show, user_id: user.id, id: achievement.id
      page_achievement = assigns[:achievement]

      expect(achievement).to eql page_achievement
    end

    it "renders the :show view" do
      user.profile.achievements << achievement

      get :show, user_id: user.id, id: achievement.id

      expect(response).to render_template :show
    end
  end
end