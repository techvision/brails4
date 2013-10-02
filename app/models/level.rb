class Level
  include Mongoid::Document

  field :seq_number, type: Integer
  field :name, type: String

  has_many :topics, order: desc(:created_at)
  embeds_many :questions, as: :questionable
  has_many :comments, as: :commentable

  validates :name, :topics, :presence => true
  validates_format_of :name, :with => /\A[a-zA-Z]*\z/, :message => "Invalid name format!"
end
