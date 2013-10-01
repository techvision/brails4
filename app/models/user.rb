class User
  include Mongoid::Document
  include Mongoid::Document::Roleable

  embeds_one :profile
  has_many :attempts
end
