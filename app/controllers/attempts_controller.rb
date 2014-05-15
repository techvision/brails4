class AttemptsController < ApplicationController
#  before_filter :find_attemptable, only: :create

  def create
    if current_user      
      if Attempt.create_attempt(current_user, params[:attempt])
        flash[:notice] = 'Correct Answer!!'
        topic = Question.find(params[:attempt][:question_id]).questionable
        @attempts = Attempt.where(:profile => current_user.profile)
        if @attempts.count > 0
          question = Question.find(params[:attempt][:question_id])
          attempt = @attempts.detect {|attempt| attempt.question == question}
          if attempt.solved == false
            @attempt = Attempt.new(question: attempt.question)
          else
            question = topic.questions.detect {|question| attempt.question != question}
            @attempt = Attempt.new(question: question)
          end
        end
      
#        @attempt = Attempt.new(question: Question.last)
      else
        flash[:error] = 'Wrong Answer!!'
      end
    else
      session[:topic_id] = params[:attempt][:topic_id]
      render :js => "window.location = '/users/sign_in'"
    end
  end

  private

  def find_attemptable
    klass = [Level,Topic,Content].detect { |c| params["#{c.name.underscore}_id"]}
    @attemptable = klass.find(params["#{klass.name.underscore}_id"])
  end
end
