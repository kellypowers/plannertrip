# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Event.create(name: "Liberty Bell", category: "Sight-Seeing", comment: "", street: "Market St", city: "Philadelphia", state: "PA", country: "USA")
Event.create(name: "Philadelphia Museum of Art", category: "Museums", comment: "", street: "2600 Benjamin Franklin Pkwy", city: "Philadelphia", state: "PA", country: "USA")
Event.create(name: "Reading Terminal Market", category: "Shopping", comment: "", street: "51 N 12th St, Philadelphia, PA 19107", city: "Philadelphia", state: "PA", country: "USA")
Event.create(name: "Philadelphia City Hall", category: "Buildings", comment: "", street: "1400 John F Kennedy Blvd, Philadelphia, PA 19107", city: "Philadelphia", state: "PA", country: "USA")
