require 'faker'
namespace :db do
  desc "Populate database"
  task :populate => :environment do
    EventType.create(:name => 'Technical')
		EventType.create(:name => 'Cultural')
		EventType.create(:name => 'Literary')
		EventType.create(:name => 'Online')
		EventType.create(:name => 'Informal')
		EventType.create(:name => 'Adventure & Gaming')
		EventType.create(:name => 'Workshop')
		EventType.create(:name => 'Guest Lecture')
		EventType.create(:name => 'Special')
		
		Venue.create(:name => 'Online')
		Venue.create(:name => 'Project Room')
		Venue.create(:name => 'Multipurpose Hall')
		Venue.create(:name => 'Table Tennis Room')
		Venue.create(:name => 'Volleyball Court')
		Venue.create(:name => 'Paddal Stadium')
		Venue.create(:name => 'NKN Room 208')
		Venue.create(:name => 'Lecture Hall 207')
		Venue.create(:name => 'Kamand')
		
		30.times do
			User.new do |u|
			  u.firstname = Faker::Name.first_name
			  u.lastname = Faker::Name.last_name
			  u.phone = Faker::Base.regexify('9[0-9]{9}')
			  u.birthdate = Date.new
			  u.school = Faker::Company.name
			  u.email = Faker::Internet.safe_email(u.firstname)
			  u.password = '15081992'
			  u.username = Faker::Internet.user_name(u.firstname)
			  u.save!
			end
		end
		
		20.times do
			Contact.new do |c|
			  c.firstname = Faker::Name.first_name
			  c.lastname = Faker::Name.last_name
			  c.phone = Faker::Base.regexify('9[0-9]{9}')
			  c.position = Faker::Name.title
			  c.email = Faker::Internet.safe_email(c.firstname)
			  c.password = '15081992'
			  c.save!
			end
		end
		
		EventType.all.each do |t|
			5.times do
				Event.new do |e|
				  e.code = Faker::Internet.domain_word
				  e.name = e.code.camelize
				  e.description = Faker::Lorem.paragraph(sentence_count = 7)
				  e.rules = Faker::Lorem.paragraphs(paragraph_count = 6).to_yaml
				  e.submit_to = Faker::Internet.safe_email(e.code)
				  e.start = DateTime.new
				  e.end = DateTime.new + 1
				  e.venue_id = 1 + (Random.srand % Venue.count)
				  e.type = t
				  e.team_size = 1 + (Random.srand % 4)
				  e.rounds = 1 + (Random.srand % 3)
				  e.save
				end
			end
		end
  end
end
