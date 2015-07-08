# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Forums.create(name: 'SEC Rant')
Forums.create(name: 'SEC Recruiting')
Forums.create(name: 'SEC Tickets')
Forums.create(name: 'Off-Topic Board')

teams = ['Alabama', 'Arkansas', 'Auburn', 'Florida', 'Georgia', 'Kentucky', 'LSU',
  'Mississippi St.', 'Missouri', 'Ole Miss', 'South Carolina', 'Tennessee',
  'Texas A&M', 'Vanderbilt']

len = teams.length
i = 0
while i < len
  Forums.create(name: teams[i])
  i += 1
end
