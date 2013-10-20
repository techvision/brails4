class Achievement
  include Mongoid::Document

  field :user_id, type: BSON::ObjectId
  field :topic_id, type: BSON::ObjectId
  field :score, type: Integer, default: 0

  validates :user_id, :topic_id, :score, presence: true

  embedded_in :profile
end