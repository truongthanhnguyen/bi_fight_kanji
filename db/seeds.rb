# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.first

1.times do |index|
  userLogs = u.user_logs.build log_type: "goals", target: "user_goals", number_of_word: Faker::Number.between(1, 10)
  userLogs.save
end
