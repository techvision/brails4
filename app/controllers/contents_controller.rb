class ContentsController < ApplicationController

  def index
    @topic = Topic.find(params[:topic_id])
    @content = @topic.contents.first
  end  
end
