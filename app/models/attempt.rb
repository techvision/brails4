class Attempt
  include Mongoid::Document
  include Authority::Abilities

  field :count, type: Integer, default: 1
  field :solved, type: Boolean, default: false
  field :points, type: Integer, default: 0

  belongs_to :profile
  belongs_to :question

  validates :count, numericality: { only_integer: true }

  scope :solved, where(solved: true)
  scope :unsolved, where(solved: false)

  #Class method
  def self.create_attempt(question_id,option_id, user_id)
    user = User.find(user_id)
    question = Question.find(question_id)
    option = question.options.find(option_id)
    attempt = Attempt.get_attempt(question,user)

    if question.right_answer?(option)
      attempt.update_attribute(:solved, true)
      attempt.calculate_points
      user.profile.attempts << attempt
      user.profile.update_profile(attempt)
    else
      user.profile.attempts << attempt
    end
    true
  end

  #Instance method
  def calculate_points
    self.points = self.question.difficulty / self.count
  end

  private

  #Class Method
  def self.exists?(question, user)
    profile = user.profile
    attempt = profile.attempts.detect {|attempt| attempt.question == question }

    attempt.nil? ? false : true
  end

  #Class Method
  def self.get_attempt(question,user)
    if Attempt.exists?(question, user)
      attempt = Attempt.find_by(profile: user.profile, question: question)
      attempt.inc(count: 1)
      attempt
    else
      Attempt.new(question: question, profile: user.profile)
    end
  end
end