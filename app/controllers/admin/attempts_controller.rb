class Admin::AttemptsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin
  authorize_resource

  def index
    @user = User.find(params[:user_id])
    @attempts = @user.profile.attempts
  end

  def show
    @user = User.find(params[:user_id])
    @attempt = @user.profile.attempts.find(params[:id])
  end
end