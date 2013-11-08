class Admin::LevelsController < Admin::ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin

  def index
    @levels = Level.all.order_by("seq_number ASC")
  end

  def show
    @level = Level.find(params[:id])
    @topics = @level.topics
    @questions = @level.questions
  end

  def new
    @level = Level.new
    @level.topics.build.contents.build
  end

  def create
    @level = Level.new(level_params)
    if @level.save
      redirect_to admin_level_path(@level), notice: "Level successfully created."
    else
      @levels = Level.all
      render :index, alert: "Level could not be created."
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
      render :edit, alert: "Level could not be updated."
    end
  end

  def destroy
    @level = Level.find(params[:id])
    if @level.destroy
      redirect_to admin_levels_path, notice: "Level successfully deleted."
    else
      @levels = Level.all
      render :index, alert: "Level could not be deleted."
    end
  end

  private

  def level_params
    params.require(:level).permit(:name, :seq_number, topics_attributes: [:title, :seq_number, contents_attributes: [:title, :summary, :body, :audio_mp3, :audio_ogg ]])
  end
end
