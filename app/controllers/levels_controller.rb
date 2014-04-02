class LevelsController < ApplicationController
  
  def index
    @levels = Level.all
  end

  def show
    @level = Level.find(params[:id])
    @topics = @level.topics
  end
end
