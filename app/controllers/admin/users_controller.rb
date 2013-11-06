class Admin::UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin

  def show
    @profile = User.find(params[:user_id]).profile
  end

  def edit
    @profile = User.find(params[:user_id]).profile
  end

  def update
    @profile = User.find(params[:user_id]).profile
    if @profile.update_attributes(profile_params)
      redirect_to admin_user_path(user.id), notice: "Profile successfully updated."
    else
      render_action :edit, alert: "Profile could not be updated."
    end
  end
end