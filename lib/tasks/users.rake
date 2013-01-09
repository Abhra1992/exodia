require 'faker'
namespace :db do
  desc "Create users in database"
  task :users => :environment do
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
	end
end
