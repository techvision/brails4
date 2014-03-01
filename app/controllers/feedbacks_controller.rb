class FeedbacksController < ApplicationController
  
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.create(feedback_params)
    redirect_to user_path(current_user), notice: "Feedback successfully created"    
  end

  private
  def feedback_params
    params.require(:feedback).permit(:id, :name, :email, :country, :text)
  end
end
