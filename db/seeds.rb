# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all

user = User.create(email: 'gerson@example.com', password: 'josh1234', roles: 'admin')
user.profile = Profile.create(name: "gerson", birthdate: "19/07/1989", gender: "male", address: "kdjasldjaskjd", country: "Brazil" )
user.save!
