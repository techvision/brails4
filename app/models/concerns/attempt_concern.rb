#TODO
#The implementation of the creation of Attempts was meant to be as a Concern. But, in order to do that,
#it would be necessary to implement the create attempt logic into methods and hooks that would be 
#bundled inside the desired models. Since until the moment the only model that has this behavior is
#the Attempt model itself, I will first implement the logic inside the model . After that,
#the logic can easily be extracted into a Concern.

module AttemptConcern
  extend ActiveSupport::Concern

  #Class Method
  def exists?(question, user)
    profile = user.profile
    attempt = profile.attempts.detect {|attempt| attempt.question == question }

    attempt.nil? ? false : true
  end

  #Class Method
  def get_attempt(question,user)
    if Attempt.exists?(question)
      attempt = Attempt.find_by(profile: user.profile, question: question)
      attempt.count++
      attempt
    else
      Attempt.new(question_id: question_id, profile: current_user.profile)
    end
  end

  #Instance method
  def calculate_points
    if self.question.right_answer?(self.option_id)
      self.solved = true
      self.points = self.question.difficulty / self.count
      user.profile.points += self.points
    end
  end

  #Class method
  def create_attempt(question_id,option_id, user_id)
    question = Question.find(question_id)
    option = question.options.find(option_id)
    attempt = Attempt.get_attempt(question)

    if question.right_answer?(option)
      attempt.update_attribute(solved: true)
      attempt.calculate_points
      attempt.update_profile_achievements
      attempt.save
    else
      attempt.save
    end
  end

  def update_profile_achievements
    self.profile.update_achievements(self) if self.solved?
  end
end