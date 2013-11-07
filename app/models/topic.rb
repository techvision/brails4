class Topic
  include Mongoid::Document

  field :title, type: String
  field :seq_number, type: Integer

  belongs_to :level
  has_many :contents
  embeds_many :comments, as: :commentable
  has_many :questions, as: :questionable

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
end