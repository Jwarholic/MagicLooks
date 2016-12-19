# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

#Seed some users!
User.create!( name: "Dawit",
							email: "d@d.com",
							password: 'p',
							face_id: '61dbaa98-427b-4e52-acce-3ef301363769')

User.create!( name: "Jason",
							email: "j@j.com",
							password: 'p',
							face_id: 'a6dcb570-ce43-420b-a1a0-179a11065b69' )

User.create!( name: "collin",
							email: "c@c.com",
							password: 'p',
							face_id: '2d95aac1-4374-4923-bca0-682b9aeccecf')

User.create!( name: "brandon",
							email: "b@b.com",
							password: 'p',
							face_id: '412b2789-8c46-46e6-bc6c-75812881c95b')

User.create!( name: "amrin",
							email: "a@a.com",
							password: 'p',
							face_id: '3aaac689-72d8-41ce-82b4-51e420472e4b')

5.times{Mirror.create!(face_id: nil, owner_id: rand(1..5))}

UserMirror.create(user_id: 1, mirror_id: 1)



