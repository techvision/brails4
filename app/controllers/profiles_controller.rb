class ProfilesController < ApplicationController
  load_resource :user
  load_and_authorize_resource :profile, through: :user, singleton: true

  def show
    @profile = Profile.find(params[:id])
    @user = @profile.user
  end

  def new
    @profile = Profile.new
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
    if @profile.update_attributes(profile_params)
      redirect_to user_profile_path(@profile.user, @profile), notice: "Profile successfully updated."
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:id, :name, :gender, :address, :country, :total_points, :user_id)
  end
  
end
