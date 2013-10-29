class Level
  include Mongoid::Document

  field :seq_number, type: Integer
  field :name, type: String

  has_many :topics
  has_many :questions, as: :questionable
  embeds_many :comments, as: :commentable

  validates :name, :topics, presence: true
  validates :seq_number, numericality: { only_integer: true, :greater_than => 0 }
end