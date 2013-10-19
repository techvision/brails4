class Question
  include Mongoid::Document

  field :title, type: String
  field :difficulty, type: Integer

  embeds_many :options
  has_many :attempts
  embeds_many :comments, as: :commentable
  embedded_in :questionable, polymorphic: true

  validates :title,:options,:difficulty, presence: true
  validates :options, length: { minimum: 3, maximum: 5}
  validate :only_one_correct_answer


  #TODO
  # mudar answer por criar um attempt

  def only_one_correct_answer
    options = self.options.select { |option| option.correct }
    unless options.size == 1
      errors.add(:options, "question can only have one correct answer")
    end
  end
end