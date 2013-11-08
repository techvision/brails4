class Admin::TopicsController < Admin::ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin

  #TODO
  #Fix render actions issues

  def index
    @level = Level.find(params[:level_id])
    @topics = @level.topics.all.order_by("seq_number ASC")
  end

  def show
    @topic = Topic.find(params[:id])
    @contents = @topic.contents
    @questions = @topic.questions
  end

  def new
    @level = Level.find(params[:level_id])
    @topic = @level.topics.build
    @topic.contents.build
  end

  def create
    @level = Level.find(params[:level_id])
    @topic = @level.topics.build(topic_params)
    if @topic.save
      redirect_to admin_level_topic_path(@topic), notice: "Topic successfully created."
    else
      redirect_to admin_level_path(@level), alert: "Topic could not be created."
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update_attributes(topic_params)
      redirect_to admin_topic_path(@topic), notice: "Topic successfully updated."
    else
      render action: :edit, alert: "Topic could not be updated."
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    if @topic.destroy
      redirect_to admin_level_path(@topic.level_id), notice: "Topic successfully deleted."
    else
      redirect_to admin_level_path(@topic.level_id), alert: "Topic could not be deleted."
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :seq_number, contents_attributes: [:title,:body,:summary, :audio_mp3, :audio_ogg])
  end
end