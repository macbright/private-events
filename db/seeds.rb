# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!( name:  "John Don",
              email: "john@example.com" )


10.times do
name  = Faker::Name.name
email = "#{name.split(' ').first.downcase}@abc.com"

User.create!( name: name,
              email: email )
end

30.times do
  title = Faker::BossaNova.song #=> "Chega de Saudade"
  description = Faker::GreekPhilosophers.quote #=> "Only the educated are free."

  event_date = Faker::Date.between(from: 30.days.ago, to: 30.days.from_now)
  location = Faker::Address.street_address + ', ' +
  Faker::Address.city
  creator_id = User.all.ids.sample

  Event.create!(  title: title,
                  description: description,
                  event_date: event_date,
                  location: location,
                  creator_id: creator_id )
end

users = User.all

users.each do |u|
  attendee_id = u.id
  count = 0
  until count > 8 do 
    temp_id = Event.all.ids.sample
    if !User.find_by(id: attendee_id).attended_events.ids.include?(temp_id)
      attended_event_id = temp_id
      Attendance.create!( attendee_id: attendee_id,
                          attended_event_id: attended_event_id )
      count += 1
    end
  end
end