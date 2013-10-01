class Topic
  include Mongoid::Document

  belongs_to :level
  has_many :contents
  has_many :attempts

end
