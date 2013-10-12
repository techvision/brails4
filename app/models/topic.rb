class Topic
  include Mongoid::Document

  field :title, type: String
  field :seq_number, type: Integer

  belongs_to :level
  has_many :contents
  embeds_many :comments, as: :commentable
  embeds_many :questions, as: :questionable

  validates :seq_number, :title, :contents, :presence => true
  validates :seq_number, numericality: { only_integer: true, :greater_than => 0 }
end