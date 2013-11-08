class Admin::AchievementsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin
  layout 'admin'

  def index
    @user = User.find(params[:user_id])
    @achievements = @user.profile.achievements
  end

  def show
    @user = User.find(params[:user_id])
    @achievement = @user.profile.achievements.find(params[:id])
  end
end