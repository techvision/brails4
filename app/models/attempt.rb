class Attempt
  include Mongoid::Document

  field :count, type: Integer, default: 1
  field :solved, type: Boolean, default: false
  field :points, type: Integer, default: 0

  belongs_to :profile
  belongs_to :question

  validates :count, numericality: { only_integer: true }

  scope :solved, where(solved: true)
  scope :unsolved, where(solved: false)
end