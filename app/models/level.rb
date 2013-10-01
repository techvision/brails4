class Level
  include Mongoid::Document

  field :seq_number, type: Integer
  field :name, type: String

  has_many :topics, order: desc(:created_at)
  embeds_many :questions, as: :questionable

  validates :seq_number, :name, :topics, :presence => true
  validates :seq_number, :numericality => {:only_integer => true,  :greater_than => 0 }
  validates_format_of :name, :with => /[a-zA-Z]/, :message => "Invalid name format!"
end
