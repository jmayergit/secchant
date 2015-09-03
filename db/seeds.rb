# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Forum.create(name: 'SEC Rant', image: "SEC-Football-rs4.jpg", description: "Mingle with SEC fans from all schools")
Forum.create(name: 'SEC Recruiting', image: "SECRecruiting.gif", description: "Get the latest on the recruiting scene")
Forum.create(name: 'SEC Tickets', image: "TicketW.jpg", description: "Buy, sell and trade your way to any event")
Forum.create(name: 'Off-Topic Board', image: "SECW.jpg", description: "Off-topic discussion on just about anything")
Forum.create(name: 'Help Board')

teams = [['Alabama',"alabama-flags-366_rs2.jpg", "Sweet Home to Bama Sports Talk"], ['Arkansas',"arkansas-flag-353_rs2.jpg","Woooooooooo, Pig! Sooie!"],
         ['Auburn',"auburn-flag-2-a-340_rs2.jpg", "War Damn Eagle!"], ['Florida',"florida-gator-mascot-341_rs2.jpg", "Cheer for the Orange and Blue"],
         ['Georgia',"georgia-mascot-342_rs2.jpg","If your blood runs red and black..."], ['Kentucky',"kentucky-basketball-court-356_rs2.jpg", "Make this your old Kentucky home"],
         ['LSU',"LSU-Football-rs3.jpg", "Discuss LSU Sports with fellow Tiger fans"], ['Mississippi St.',"mississippi-state-helmet-359_rs2.jpg", "Hail State! and go to hell Ole Miss"],
         ['Missouri',"missouri-helmet-2080_rs2.jpg", "Fight, Tiger, fight for old Mizzou"], ['Ole Miss',"ole-miss-mascot-351_rs2.jpg", "Are you ready...to talk Rebel sports?"],
         ['South Carolina',"south-carolina-flag-373_rs2.jpg", "Discuss USC Sports with fellow Cock Fans"], ['Tennessee',"tennessee-logo-355_rs2.jpg", "Good old Rocky Top Talk"],
         ['Texas A&M',"texas-a-and-m-logo-375_rs2.jpg", "Gig 'em, Aggies!"], ['Vanderbilt',"vanderbilt-logo-344_rs2.jpg", "Go here for Vandy Talk"]]

len = teams.length
i = 0
while i < len
  Forum.create(name: teams[i][0], image: teams[i][1], description: teams[i][2], team_forum: true)
  i += 1
end
