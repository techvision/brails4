class TopicsController < ApplicationController

  def show
    level = Level.find(params[:level_id])
    achievements = current_user.profile.achievements
    topic = Topic.find(params[:topic_id])
    if current_user.profile.finished_previous_topics?(topic) 
      @topic = Topic.find(params[:topic_id]) 
    else
      redirect_to admin_level_topics_path(@level.id) 
      flash[:error] = "You can not access this topic yet."
    end   
  end
end
