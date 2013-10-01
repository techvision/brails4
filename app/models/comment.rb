class Comment
  include Mongoid::Document

  belongs_to :request
end
