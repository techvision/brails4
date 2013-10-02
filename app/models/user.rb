class User
  include Mongoid::Document

  embeds_one :profile
  has_many :attempts
  has_many :comments, as: :commentable
  
  
end
