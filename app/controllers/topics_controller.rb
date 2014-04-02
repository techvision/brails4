class TopicsController < ApplicationController

  def show
#    level = Level.find(params[:level_id])
#    achievements = current_user.profile.achievements
    topic = Topic.find(params[:id])
    if current_user.profile.finished_previous_topics?(topic.id) 
      @topic = topic
    else
      redirect_to topics_path 
      flash[:error] = "You can not access this topic yet"
    end   
  end

  def showcontent
    @content = Content.find(params[:content_id])
  end
end
