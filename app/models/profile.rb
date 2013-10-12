class Profile
  include Mongoid::Document

  field :name, type: String
  field :birthdate, type: Date
  field :gender, type: String
  field :address, type: String
  field :country, type: String
  field :total_points, type: Integer, default: 0

  belongs_to :user
  has_many :attempts
  embeds_many :invitations
  embeds_many :achievements

  validates :name, :birthdate, :gender, :address, :country, presence: true
end