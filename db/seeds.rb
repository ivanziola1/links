# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin = User.where(email: 'admin@example.com').first_or_create do |a|
  a.role = 'admin'
  a.password = 'password'
  a.password_confirmation = 'password'
end
user = User.where(email: 'test@example.com').first_or_create do |a|
  a.role = 'registered'
  a.password = 'password'
  a.password_confirmation = 'password'
end
