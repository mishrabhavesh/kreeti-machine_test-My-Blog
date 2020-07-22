Category.create!(name: "Javascript")
Category.create!(name: "Rails")
Category.create!(name: "Angualar")
Category.create!(name: "Postgresql")
Category.create!(name: "React")

puts "Categories created"

Role.create(role: "ADMIN")
Role.create(role: "USER")

puts "Roles for user created"

Role.first.users.create(email: "admin@admin.com", password: "111111")
Role.last.users.create(email: "user@user.com", password: "111111")

puts "User created"