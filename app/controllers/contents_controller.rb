class ContentsController < ApplicationController

  def index
    @topic = Topic.find(params[:topic_id])
    @content = @topic.contents.first
#    que = (0..@topic.questions.count-1).sort_by{rand}.slice(0, @topic.questions.count).collect! do |i| Question.skip(i).first end
    @attempt = Attempt.new(question: @topic.questions.first)
  end  
end
