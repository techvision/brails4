class Admin::QuestionsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin
  before_filter :find_questionable, only: [:index, :create, :new]
  layout 'admin'

  def index
    @questions = @questionable.questions.all.order_by("seq_number ASC")
  end

  def show
    @question = Question.find(params[:id])
    @options = @question.options
  end

  def new
    @question = @questionable.questions.build
    3.times { @question.options.build }
  end

  def create
    @question = @questionable.questions.build(question_params)
    if @question.save
      redirect_to [:admin, @questionable], notice: "Question successfully created."
    else
      render action: :new, alert: "Question could not be created."
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    questionable = @question.questionable
    if @question.update_attributes(question_params)
      redirect_to [:admin, questionable], notice: "Question successfully updated."
    else
      render action: :edit, alert: "Question could not be updated."
    end
  end

  def destroy
    @question = Question.find(params[:id])
    questionable = @question.questionable
    if @question.destroy
      redirect_to [:admin, questionable], notice: "Question successfully deleted."
    else
      render action: :index, alert: "Question could not be deleted."
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :difficulty, options_attributes: [:text,:correct])
  end

  def find_questionable
    klass = [Level,Topic,Content].detect { |c| params["#{c.name.underscore}_id"]}
    @questionable = klass.find(params["#{klass.name.underscore}_id"])
  end
end