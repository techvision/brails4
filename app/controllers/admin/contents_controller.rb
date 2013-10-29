class Admin::ContentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin
  authorize_resource

  def index
    @topic = Topic.find(params[:topic_id])
    @contents = @topic.contents.all.order_by("seq_number ASC")
  end

  def show
    @content = Content.find(params[:id])
    @topic = Topic.find(@content.topic_id)
  end

  def new
    @content = Content.new
    @topic = Topic.find(params[:topic_id])
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @content = @topic.contents.build(content_params)
    if @content.save
      redirect_to admin_content_path(@content), notice: "Content successfully created."
    else
      render action: :new, alert: "Content could not be created."
    end
  end

  def edit
    @content = Content.find(params[:id])
    @topic = Topic.find(@content.topic_id)
  end

  def update
    @content = Content.find(params[:id])
    @topic = Topic.find(@content.topic_id)
    if @content.update_attributes(content_params)
      redirect_to admin_content_path(@content), notice: "Content successfully updated."
    else
      render action: :edit, alert: "Content could not be updated."
    end
  end

  def destroy
    @content = Content.find(params[:id])
    @topic = Topic.find(@content.topic_id)
    if @content.destroy
      redirect_to admin_topic_contents_path(@topic), notice: "Content successfully deleted."
    else
      render action: :index, alert: "Content could not be deleted."
    end
  end

  private

  def content_params
    params.require(:content).permit(:title,:body,:summary)
  end
end