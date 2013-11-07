class Option
  include Mongoid::Document

  field :text, type: String
  field :correct, type: Mongoid::Boolean

  embedded_in :question

  validates :text, length: { maximum: 30 }
  validates :text, :correct, presence: true
  validates :correct, inclusion: { :in => [true, false] }
end