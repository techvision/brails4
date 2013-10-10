class Level
  include Mongoid::Document

  field :seq_number, type: Integer
  field :name, type: String

  has_many :topics, order: desc(:created_at)
  embeds_many :bonus_questions, class_name: "Question", inverse_of: :questionable
  has_many :comments, as: :commentable

  validates :name, :topics, presence: true
end
