class QuestionsController < ApplicationController
  before_filter :find_questionable

  def show
    if Question.find(params[:id]).nil?
      redirect_to @questionable
    else
      @question = Question.find(params[:id]) 
    end
  end

  private

  def find_questionable
    klass = [Level,Topic,Content].detect { |c| params["#{c.name.underscore}_id"]}
    @questionable = klass.find(params["#{klass.name.underscore}_id"])
  end
end
