class Achievement
  include Mongoid::Document

  field :score, type: Integer, default: 0

  validates :topic_id, :score, presence: true

  belongs_to :topic
  embedded_in :profile
end