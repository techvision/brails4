class Feedback
  include Mongoid::Document

  field :name, type: String
  field :email, type: String
  field :country, type: String
  field :text, type: String

  validates :name, :email, :text, presence: true
  validates_format_of :email, with: Devise.email_regexp, message: "Invalid email format" 
end