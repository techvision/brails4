class Feedback
  include Mongoid::Document

  field :name, type: String
  field :email, type: String
  field :country, type: String
  field :text, type: String

  validates :name, :email, :text, presence: true
  validates :email, format: { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, message: "Invalid email format" }
end
