class Question
  include Mongoid::Document

  field :title, type: String
  field :difficulty, type: Integer

  embeds_many :options
  has_many :attempts
  embeds_many :comments, as: :commentable
  belongs_to :questionable, polymorphic: true

  validates :title,:options,:difficulty, presence: true
  validates :options, length: { minimum: 3, maximum: 5}
  validates :questionable_id, presence: true
  validate :only_one_correct_answer

  accepts_nested_attributes_for :options
  
  #Returns True when user has a solved attempt for the question
  def answered?(user_id)
    user = User.find(user_id)
    return false if user.profile.attempts.solved.detect {|attempt| attempt.question_id == self.id}.nil?
    true
  end

  #Returns True if the option is the right answer for the question
  def right_answer?(option_id)
    self.options.find(option_id).correct
  end

  #Returns the Topic that the question belongs or nil case is a Level question
  def find_topic
    if questionable.class == Topic
      return questionable
    elsif questionable.class == Content
      return questionable.topic
    end
    nil 
  end

  private

  def only_one_correct_answer
    unless self.options.where(correct: true).count == 1 
      errors.add(:options, "question can only have one correct answer")
    end
  end
end