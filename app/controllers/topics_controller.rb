class TopicsController < ApplicationController

  def show
    @level = Level.find(params[:level_id])
    @achievements = current_user.profile.achievements
    if current_user.profile.finished_previous_topics?(params[:id]) == true
      @topic = Topic.find(params[:id]) 
    else
      redirect_to admin_level_topics_path(@level.id), notice: "You can not access this topic yet."
    end   
  end
end
