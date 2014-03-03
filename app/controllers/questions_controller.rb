class QuestionsController < ApplicationController
  before_filter :find_questionable

  def show
    @question = Question.offset(rand(@questionable.questions.count)).first 
  end

  private

  def find_questionable
    klass = [Level,Topic,Content].detect { |c| params["#{c.name.underscore}_id"]}
    @questionable = klass.find(params["#{klass.name.underscore}_id"])
  end
end
