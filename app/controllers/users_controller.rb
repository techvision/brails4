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
      flash[:alert] = "User could not be updated"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :email)
  end
end
