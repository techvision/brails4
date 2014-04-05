class Role
  include Mongoid::Document

  has_many :users

  Admin   = "admin"
  Student = "student"

  field :name, default: Role::Student

end
