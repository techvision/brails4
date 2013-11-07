class Admin::TopicsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin

  def index
    @level = Level.find(params[:level_id])
    @topics = @level.topics.all.order_by("seq_number ASC")
  end

  def show
    @topic = Topic.find(params[:id])
    @contents = @topic.contents
  end

  def new
    @level = Level.find(params[:level_id])
    @topic = @level.topics.new
  end

  def create
    @level = Level.find(params[:level_id])
    @topic = @level.topics.build(topic_params)
    if @topic.save
      redirect_to admin_level_path(@level), notice: "Topic successfully created."
    else
      render :index, alert: "Topic could not be created."
    end
  end

  def edit
    @topic = Topic.find(params[:id])
    @level = Level.find(@topic.level_id)
  end

  def update
    @topic = Topic.find(params[:id])
    @level = Level.find(@topic.level_id)
    if @topic.update_attributes(topic_params)
      redirect_to admin_topic_path(@topic), notice: "Topic successfully updated."
    else
      render action: :edit, alert: "Topic could not be updated."
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @level = Level.find(@topic.level_id)
    if @topic.destroy
      redirect_to admin_level_topics_path(@level), notice: "Topic successfully deleted."
    else
      render action: :index, alert: "Topic could not be deleted."
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :seq_number, content_attributes: [:title,:body,:summary, :audio_mp3, :audio_ogg])
  end
end