require 'spec_helper'

describe AchievementsController do
  let(:user) { FactoryGirl.create(:user)}
  let(:level) { FactoryGirl.create(:level)}
  let(:topic) { level.topics.last}
  let(:achievement) { FactoryGirl.create(:achievement, user_id: user.id, topic_id: topic.id)}

  describe "GET #index" do
    get :index, user_id: user.id

    page_achievements = assigns[:achievements]

    expect(achievement).to eql page_achievements
  end

  describe "GET #show" do
    get :show, user_id: user.id, achievement_id: achievement.id

    page_achievement = assigns[:achievement]

    expect(achievements).to eql page_achievement
  end
end