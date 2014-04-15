class ContentsController < ApplicationController

  def index
    @topic = Topic.find(params[:topic_id])
    que = @topic.questions.first
    @attempt = Attempt.new(question: que)
    @content = @topic.contents.first
  end  
end
