class Admin::UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin
  layout 'admin'

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @achievements = @user.profile.achievements
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to admin_user_path(@user), notice: "Profile successfully updated."
    else
      render_action :edit, alert: "Profile could not be updated."
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :email, profile_attributes: [:id, :name, :gender, :birthdate, :country, :address])
  end
end