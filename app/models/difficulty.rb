class Difficulty
  include Mongoid::Document

  field :name, type: String
  field :points, type: Integer

  belongs_to :question

  validates :name, :points, presence: true

end
