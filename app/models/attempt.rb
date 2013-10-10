class Attempt
  include Mongoid::Document

  field :count, type: Integer, default: 0
  field :solved, type: Boolean, default: false
  field :points, type: Integer, default: 0

  belongs_to :user
  belongs_to :question

  validates :count, numericality: { only_integer: true }

  scope :solved, ->(user_id){ where(solved: true) }
end