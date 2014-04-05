class Option
  include Mongoid::Document
  include Mongoid::Slug

  field :text, type: String
  field :correct, type: Mongoid::Boolean, default: false

  slug :text

  embedded_in :question

  validates :text, length: { maximum: 30 }
  validates :text, :correct, presence: true
  validates :correct, inclusion: { :in => [true, false] }
end
