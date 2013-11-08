class Admin::FeedbacksController < Admin::ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin

  def index
    @feedbacks = Feedback.all
  end

  def show
    @feedback = Feedback.find(params[:id])
  end
end