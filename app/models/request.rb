class Request
  include Mongoid::Document

  has_many :comments
end
