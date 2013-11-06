class Admin::LevelsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin

  def index
    @levels = Level.all.order_by("seq_number ASC")
  end

  def show
    @level = Level.find(params[:id])
    @topics = @level.topics
  end

  def new
    @level = Level.new
  end

  def create
    @level = Level.new(level_params)
    if @level.save
      redirect_to admin_level_path(@level), notice: "Level successfully created."
    else
      render action: :new, alert: "Level could not be created."
    end
  end

  def edit
    @level = Level.find(params[:id])
  end

  def update
    @level = Level.find(params[:id])
    if @level.update_attributes(level_params)
      redirect_to admin_level_path(@level), notice: "Level successfully updated."
    else
      render action: :edit, alert: "Level could not be updated."
    end
  end

  def destroy
    @level = Level.find(params[:id])
    if @level.destroy
      redirect_to admin_levels_path, notice: "Level successfully deleted."
    else
      render action: :index, alert: "Level could not be deleted."
    end
  end

  private

  def level_params
    params.[:level].permit!
  end
end