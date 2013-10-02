class Difficulty
  include Mongoid::Document

  field :name, type: String
  field :points, type: Integer

  belongs_to :question

  validates :name, :points, :presence => true
  validates_format_of :name, :with => /\A[a-zA-Z]*\z/, :message => "Invalid name format!"

end
