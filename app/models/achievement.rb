class Achievement
  include Mongoid::Document

  field :score, type: Integer, default: 0

  validates :user_id, :topic_id, :score, presence: true

  belongs_to :topic
  belongs_to :user
  embedded_in :profile
end