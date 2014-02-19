class AchievementsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @achievements = @user.profile.achievements
  end
  
  def show
    @user = User.find(params[:user_id])
    @achievement = @user.profile.achievements.find(params[:id])
  end
end
