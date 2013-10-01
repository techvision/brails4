class Option
  include Mongoid::Document

  belongs_to :question
end
