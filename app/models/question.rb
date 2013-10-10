class Question
  include Mongoid::Document

  field :title, type: String

  embeds_many :options
  has_many :attempts
  has_one :difficulty
  has_many :comments, as: :commentable
  embedded_in :questionable, polymorphic: true

  validates :title,:options, presence: true
  validates :options, length: { minimum: 3, maximum: 5}
  validate :only_one_correct_answer

  def only_one_correct_answer
    options = self.options.select { |option| option.correct }
    unless options.size == 1
      errors.add(:options, "question can only have one correct answer")
    end
  end
end 

