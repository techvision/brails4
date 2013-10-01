class Level
  include Mongoid::Document

  field :seq_number, type: Integer
  field :name, type: String

  has_many :topics, order: desc(:created_at)
  embeds_many :questions, as: :questionable

  validates :name, :topics, :presence => true
  validates_format_of :name, :with => /[a-zA-Z]/, :message => "Invalid name format!"
end
