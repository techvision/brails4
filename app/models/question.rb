class Question
  include Mongoid::Document

  has_many :options
  has_many :attempts

  embedded_in :questionable, polymorphic: true
end
