# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Groups



Group.create({
  name: "Madrona",
  description: "A Buy Nothing Community for Madrona Elementary Families",
  map: "http://madronaseattle.com/wp-content/uploads/2016/02/madrona-school-sign-tp.jpg",
  city: "Seattle",
  state: "WA",
  country: "USA"
  })

Group.create({
  name: "McGilvra",
  description: "A Buy Nothing Community for McGilvra Elementary Families",
  map: "https://images.squarespace-cdn.com/content/v1/50eb111de4b0404f377186e1/1419288658957-SNKZV06E4MNL4P35PFWD/ke17ZwdGBToddI8pDm48kL7EtW8H1IgC1YtW3y4-ABhZw-zPPgdn4jUwVcJE1ZvWQUxwkmyExglNqGp0IvTJZUJFbgE-7XRK3dMEBRBhUpzlTTwnHGA7Q5CLEaV4mxnu5vDd8j3L1RAxGFL86AV7EIMalYFyDodkMh83JurAr10/mcgilvra-elementary.jpg?format=1000w",
  city: "Seattle",
  state: "WA",
  country: "USA"
  })

  Group.create({
    name: "The Bush School",
    description: "A Buy Nothing Community for The Bush School Families",
    map: "https://tileroofing.org/wp-content/uploads/2013/11/Bush-School.jpg",
    city: "Seattle",
    state: "WA",
    country: "USA"
    })

Member.create({
  username: "becca",
  email: "becca@ada.com",
  last: "e",
  first: "b"
})

Member.create({
  username: "orion",
  email: "orion@ada.com",
  last: "e",
  first: "o"
})

Member.create({
  username: "viva",
  email: "viva@ada.com",
  last: "e",
  first: "v"
})

10.times do
  last =  Faker::Name.unique.last_name
  first =  Faker::Name.unique.first_name
  username = first.downcase+last.downcase
  Member.create({
    username: first.downcase+last.downcase,
    email: username+"@gmail.com",
    first: first,
    last: last
    })
end

i = 0
members = Member.all
Group.all.each do |group|
  Relationship.create(group_id: group.id, member_id: members[i].id, status: "owner")
  i+=1
end

