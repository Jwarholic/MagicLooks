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

User.create!( name: "Collin",
							email: "c@c.com",
							password: 'p',
							person_id: '96c1e8c1-d6b1-43ba-9e45-02e9118d4430')

User.create!( name: "Brandon",
							email: "b@b.com",
							password: 'p',
							person_id: 'b99a77b1-558c-4102-b19c-512cad4618a6')

User.create!( name: "Amrin",
							email: "a@a.com",
							password: 'p',
							person_id: 'c5d05231-b1ac-49cb-8ba6-f7bda5b4fda1')

User.create!( name: "Vivi",
							email: "a@a.com",
							password: 'p',
							person_id: '0ffdb962-f6e0-4f6c-bcf5-4d69a4125c01')

User.create!( name: "Kelvin",
							email: "a@a.com",
							password: 'p',
							person_id: '1e00edc0-bf47-437e-8dfb-00c98be186af')

User.create!( name: "Tony",
							email: "a@a.com",
							password: 'p',
							person_id: '38bc48a7-30e6-4cd2-ae2c-9c714d11048f')

User.create!( name: "Hunter",
							email: "a@a.com",
							password: 'p',
							person_id: '3e5753e9-61c4-4305-9fc5-77db48c5c239')

User.create!( name: "Julia",
							email: "a@a.com",
							password: 'p',
							person_id: '46226974-2860-4bd5-ab77-c6e29c2867d3')

User.create!( name: "Ashley",
							email: "a@a.com",
							password: 'p',
							person_id: '5139502a-fd2e-4e27-a28f-d76890bada2e')

User.create!( name: "Arlene",
							email: "a@a.com",
							password: 'p',
							person_id: '578ed50e-3bfb-4415-9778-10b45573aba6')

User.create!( name: "Mo",
							email: "a@a.com",
							password: 'p',
							person_id: '803b217f-73e3-42e9-8999-01428dffaf92')

User.create!( name: "Zara",
							email: "a@a.com",
							password: 'p',
							person_id: 'a087d94f-121d-444e-9663-56017bb4a618')

User.create!( name: "Robert",
							email: "a@a.com",
							password: 'p',
							person_id: 'a9df57ab-79fc-4738-927d-d8681961c0e4')

User.create!( name: "Angie",
							email: "a@a.com",
							password: 'p',
							person_id: 'bebad8b0-a075-47d8-bee3-3c83513d6113')

User.create!( name: "Max",
							email: "a@a.com",
							password: 'p',
							person_id: 'c22f8183-9bb5-4f99-9a99-372799b0e785')


User.create!( name: "Pari",
							email: "a@a.com",
							password: 'p',
							person_id: 'ce8c154f-bcc8-43f2-b34b-68fba09efaf1')

User.create!( name: "Ken",
							email: "a@a.com",
							password: 'p',
							person_id: 'da320d45-d666-4205-9b78-aa8d722cf92d')

User.create!( name: "Heather",
							email: "a@a.com",
							password: 'p',
							person_id: '8d43521a-7f7b-4f3a-8d64-cbc14d34fcab')

User.create!( name: "Christian",
							email: "a@a.com",
							password: 'p',
							person_id: 'ed3b008d-1501-4d94-b9f4-5e6e2fb92948')

User.create!( name: "Alex McLeod ",
							email: "a@a.com",
							password: 'p',
							person_id: '56833a11-9586-40de-bd91-065e3b2c3d96')

User.create!( name: "Alex Min",
							email: "a@a.com",
							password: 'p',
							person_id: '26c713a9-2a85-4b23-be31-74e5c452e6a9')

User.create!( name: "Pablo",
							email: "a@a.com",
							password: 'p',
							person_id: 'dab9beb0-7512-4a76-a107-cc988e9a6518')

User.create!( name: "Dana",
							email: "a@a.com",
							password: 'p',
							person_id: '892bd49f-f753-46bf-9884-2159c0249172')

Mirror.create!(person_id: nil, owner_id: 1, email: 'd@d.com', password:'p')

UserMirror.create(user_id: 1, mirror_id: 1)



