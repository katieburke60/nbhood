# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# members = Member.create!([
#   { name: 'afs', relationship_status: 'red' },
#   { name: 'gasa', relationship_status: 'yellow' },
#   { name: 'xasc', relationship_status: 'green' },
#   { name: 'vdava', relationship_status: 'green' }
#   ])


  events = Event.create!([
    { name: 'hey', capacity: 20, active: true, location:"50 murray street", price_description:"2 beers for $3", datetime: Time.now },
    { name: 'hij', capacity: 60, active: true, location:"11 broadway", price_description:"20 open bar", datetime: Time.now},
    { name: 'ml', capacity: 100, active: true, location:"20 mott street", price_description:"beer and burger for $5", datetime: Time.now },
    { name: 'asd', capacity: 5, active: false, location:"80 chambers street", price_description:"buy one drink get one free", datetime: Time.now }
    ])

    category = Category.create([
      { name: 'food', description: "food" },
      { name: 'bar', description: "drinks at bar or club" },
      { name: 'service', description: "philanthropic or other service related" },
      { name: 'outside', description: "outside activities including sport and more relaxing" }
      ])
