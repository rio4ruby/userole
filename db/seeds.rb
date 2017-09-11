# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create some users and roles
CreateUserService['admin@example.com', 'adminadmin', :admin]
CreateUserService['boss@example.com', 'bossboss', :admin, :manager]
CreateUserService['user@example.com', 'useruser', :member]
puts 'Created roles: ' + Role.all.map(&:name).join(', ')
puts 'Created users: ' + User.all.map(&:email).join(', ')
