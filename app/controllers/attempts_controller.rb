class AttemptsController < ApplicationController

  def create
    if current_user
      if Attempt.create_attempt(current_user, params[:attempt])
        flash[:notice] = 'Correct Answer!!'
        @attempt = Attempt.new(question: Question.last)
      else
        flash[:error] = 'Wrong Answer!!'
      end
    else
      session[:topic_id] = params[:attempt][:topic_id]
      render :js => "window.location = '/users/sign_in'"
    end
  end
end
