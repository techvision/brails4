class Level
  include Mongoid::Document

  has_many :topics
  has_many :questions

  embeds_many :questions, as: :questionable
end
