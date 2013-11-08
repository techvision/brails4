class Achievement
  include Mongoid::Document

  field :score, type: Integer, default: 0
  field :created_at, type: Time, default: ->{ Time.now }

  validates :topic_id, :score, presence: true

  belongs_to :topic
  embedded_in :profile
end