# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# primary organization for the demo
### KUDOS, INC ###
org = Organization.create(name: 'Kudos, Inc.')
user = User.create(first_name: 'John', last_name: 'Smith', email: 'johnsmith@kudos.com', password: 'johnsmith1',
                   password_confirmation: 'johnsmith1', admin: false, organization_id: org.id)
puts "#{user.attribute_for_inspect(:email)} validation failure: #{user.errors.as_json}" unless user.errors.empty?
user = User.create(first_name: 'Shawna', last_name: 'Morgan', email: 'shawnamorgan@kudos.com', password: 'shawnamorgan1',
                   password_confirmation: 'shawnamorgan1', admin: false, organization_id: org.id)
puts "#{user.attribute_for_inspect(:email)} validation failure: #{user.errors.as_json}" unless user.errors.empty?
user = User.create(first_name: 'Mary', last_name: 'Harper', email: 'maryharper@kudos.com', password: 'maryharper1',
                   password_confirmation: 'maryharper1', admin: false, organization_id: org.id)
puts "#{user.attribute_for_inspect(:email)} validation failure: #{user.errors.as_json}" unless user.errors.empty?

### SWIFTCURRENT ###
org = Organization.create(name: 'Swiftcurrent')
user = User.create(first_name: 'Steve', last_name: 'Jasper', email: 'stevejasper@swiftcurrent.com', password: 'stevejasper1',
                   password_confirmation: 'stevejasper1', admin: false, organization_id: org.id)
puts "#{user.attribute_for_inspect(:email)} validation failure: #{user.errors.as_json}" unless user.errors.empty?
user = User.create(first_name: 'Jane', last_name: 'Doe', email: 'janedoe@swiftcurrent.com', password: 'janedoe1',
                   password_confirmation: 'janedoe1', admin: false, organization_id: org.id)
puts "#{user.attribute_for_inspect(:email)} validation failure: #{user.errors.as_json}" unless user.errors.empty?