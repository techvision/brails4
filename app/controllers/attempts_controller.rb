class AttemptsController < ApplicationController

  def create
    question_id = params[:question_id]
    option_id = params[:option_id]
    Attempt.create_attempt(question_id, option_id, current_user.id)



  end

end
