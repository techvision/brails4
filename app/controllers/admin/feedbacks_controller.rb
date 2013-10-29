class Admin::FeedbacksController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin
  authorize_resource

  def index
    @feedbacks = Feedback.all
  end

  def show
    @feedback = Feedback.find(params[:id])
  end
end