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
							person_id: '3515d8a1-605b-4015-b516-d22dda0f7aa6')

User.create!( name: "Jason",
							email: "j@j.com",
							password: 'p',
							person_id: '56a9d70d-1055-49bd-8abd-a9055f7016b2' )

User.create!( name: "collin",
							email: "c@c.com",
							password: 'p',
							person_id: '96c1e8c1-d6b1-43ba-9e45-02e9118d4430')

User.create!( name: "brandon",
							email: "b@b.com",
							password: 'p',
							person_id: 'b99a77b1-558c-4102-b19c-512cad4618a6')

User.create!( name: "amrin",
							email: "a@a.com",
							password: 'p',
							person_id: 'c5d05231-b1ac-49cb-8ba6-f7bda5b4fda1')

Mirror.create!(person_id: nil, owner_id: 1, email: 'd@d.com', password:'p')

UserMirror.create(user_id: 1, mirror_id: 1)



