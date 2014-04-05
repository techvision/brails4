class Admin::ProfilesController < AdminController

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
