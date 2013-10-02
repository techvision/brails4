class Profile
  include Mongoid::Document

  field :name, type: String
  field :birthdate, type: Date
  field :gender, type: String
  field :address, type: String
  field :country, type: String

  embedded_in :user
  has_many :attempts
  has_many :comments, as: :commentable

  validates :name, :birthdate, :gender, :address, :country, :presence => true
  
end
