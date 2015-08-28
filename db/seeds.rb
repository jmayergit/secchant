# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Forum.create(name: 'SEC Rant', image: "SEC-Football-rs4.jpg")
Forum.create(name: 'SEC Recruiting', image: "SECRecruiting.gif")
Forum.create(name: 'SEC Tickets', image: "TicketW.jpg")
Forum.create(name: 'Off-Topic Board', image: "SECW.jpg")
Forum.create(name: 'Help Board')

teams = [['Alabama',"alabama-flags-366_rs2.jpg"], ['Arkansas',"arkansas-flag-353_rs2.jpg"],
         ['Auburn',"auburn-flag-2-a-340_rs2.jpg"], ['Florida',"florida-gator-mascot-341_rs2.jpg"],
         ['Georgia',"georgia-mascot-342_rs2.jpg"], ['Kentucky',"kentucky-basketball-court-356_rs2.jpg"],
         ['LSU',"LSU-Football-rs3.jpg"], ['Mississippi St.',"mississippi-state-helmet-359_rs2.jpg"],
         ['Missouri',"missouri-helmet-2080_rs2.jpg"], ['Ole Miss',"ole-miss-mascot-351_rs2.jpg"],
         ['South Carolina',"south-carolina-flag-373_rs2.jpg"], ['Tennessee',"tennessee-logo-355_rs2.jpg"],
         ['Texas A&M',"texas-a-and-m-logo-375_rs2.jpg"], ['Vanderbilt',"vanderbilt-logo-344_rs2.jpg"]]

len = teams.length
i = 0
while i < len
  Forum.create(name: teams[i][0], image: teams[i][1], team_forum: true)
  i += 1
end


Admin.create(email:"jalexismayer@gmail.com", password:"password", god_mode: true)
