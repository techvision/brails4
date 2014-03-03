class ProfilesController < ApplicationController

  def show    
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to user_profile_path(@profile.user, @profile), notice: "Profile successfully created."
    else
      render :new
    end
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update_attributes(profile_params)
      redirect_to user_profile_path(@profile.user, @profile), notice: "profile successfully updated."
    else
      render :edit
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:id, :name, :birthdate, :gender, :address, :country, :total_points, :user_id)
  end
end
