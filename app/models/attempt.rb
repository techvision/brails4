class Attempt
  include Mongoid::Document

  belongs_to :user
  belongs_to :question

end
