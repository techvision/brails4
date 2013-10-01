class Attempt
  include Mongoid::Document

  belongs_to :user
  belongs_to :question
  belongs_to :topic

end
