require 'faker'
namespace :db do
  desc "Create events in database"
  task :events => :environment do
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
				  e.team = true
				  e.rounds = 1 + (Random.srand % 3)
				  e.save
				end
			end
		end		
	end
end
