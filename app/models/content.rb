class Content
  include Mongoid::Document

  belongs_to :topic
  has_many :questions
  
end
