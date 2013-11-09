class Topic
  include Mongoid::Document

  field :title, type: String
  field :seq_number, type: Integer

  belongs_to :level
  has_many :contents, dependent: :destroy
  embeds_many :comments, as: :commentable
  has_many :questions, as: :questionable, dependent: :destroy

  validates :seq_number, :title, :contents, :presence => true
  validates :seq_number, numericality: { only_integer: true, :greater_than => 0 }

  accepts_nested_attributes_for :contents

  #Return true if user has completed all contents and solved topic questions
  def complete?(user_id)
    user = User.find(user_id)
    self.contents.each do |content|
      return false unless content.complete?(user.id)
    end
    unless self.questions.empty? then
      self.questions.each do |question|
        return false unless question.answered?(user.id)
      end
    end
    return true
  end

  #TODO
  #TEST
  #Retuns all attempts for that a given user has for questions belonging to the topic or its contents
  def attempts(user_id)
    result,questions = [],[]
    user = User.find(user_id)
    attempts = user.profile.attempts

    questions.concat(self.questions)

    self.contents.each do |content|
      questions.concat(content.questions)
    end

    attempts.each do |attempt|
      questions.each do |question|
        result << attempt if attempt.question == question
      end
    end
    result
  end
end