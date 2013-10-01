class Question
  include Mongoid::Document

  has_many :options
  has_many :attempts
  belongs_to :level
  belongs_to :content
end
