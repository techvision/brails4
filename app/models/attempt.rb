class Attempt
  include Mongoid::Document

  field :count, type: Integer, default: 1
  field :solved, type: Boolean, default: false
  field :points, type: Integer, default: 0

  belongs_to :profile
  belongs_to :question

  validates :count, numericality: { only_integer: true }

  scope :solved, where(solved: true)
  scope :unsolved, where(solved: false)

  def self.create_attempt(question_id,option_id, user_id)
    user = User.find(user_id)
    question = Question.find(question_id)
    attempt = user.profile.attempts.detect {|item| item.question_id == question_id }

    if attempt.nil?
      attempt = Attempt.new(question_id: question_id)
      user.profile.attempts << attempt
    else
      attempt.count++
    end

    if question.right_answer?(option_id)
      attempt.solved = true
      attempt.points = question.difficulty / attempt.count
      user.profile.points += attempt.points
      attempt.save
      user.profile.update_achievements(attempt)
    else
      attempt.save
    end
  end
end