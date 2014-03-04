class AttemptsController < ApplicationController

  def create
    question_id = params[:question_id]
    option_id = params[:option_id]
    Attempt.create_attempt(question_id, option_id, current_user.id)
    question = Question.find_by(id: question_id)
    if question.find_topic.complete?(current_user.id)
       current_user.profile.update_profile(question.attempt)
    end
  end
end
