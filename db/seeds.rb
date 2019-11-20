roles = ['doctor', 'nurse', 'patient']
10.times do
  office = Office.create(
    name: Faker::Name.first_name
  )
 
  10.times do 
    user = User.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name
    )

    Appointment.create(
      role: roles.sample,
      office_id: office.id,
      user_id: user.id
    )
  end
end

puts "Data Seeded."