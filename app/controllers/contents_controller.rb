class ContentsController < ApplicationController

  def index
    @topic = Topic.find(params[:topic_id])
    @content = @topic.contents.first
    @question = nil
    if current_user
      @topic.questions.each_index do |index|
        @question = @topic.questions[index]
      end
      attempt = Attempt.where(:profile => current_user.profile, :question => @question, :solved => false).first if current_user.profile.attempts.count > 0
      if attempt == nil or attempt.solved == false
        @attempt = Attempt.new(question: @question)
      end
#      @attempt = Attempt.where(:profile => current_user.profile, :solved => true)
    else
      que = (0..@topic.questions.count-1).sort_by{rand}.slice(0, @topic.questions.count).collect! do |i| Question.skip(i).first end
      @attempt = Attempt.new(question: que.first)
    end
#    @attempt = Attempt.new(question: que.first)
#    @attempt = Attempt.new(question: @topic.questions.first)
  end  
end
