# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Role.where(name: 'admin').first_or_create
Role.where(name: 'user').first_or_create
User.admins.where(email: 'admin@gmail.com').first_or_create(password: 123456)
User.users.where(email: 'user@gmail.com').first_or_create(password: 123456)
