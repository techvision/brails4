class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path(@user), notice: "User successfully updated"
    else
      render :edit, alert: "User could not be updated"
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :email)
  end
end
