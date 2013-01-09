require 'faker'
namespace :db do
  desc "Create contacts in database"
  task :contacts => :environment do
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
	end
end
