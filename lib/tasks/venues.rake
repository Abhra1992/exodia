require 'faker'
namespace :db do
  desc "Create venues in database"
  task :venues => :environment do
		Venue.create(:name => 'Online')
		Venue.create(:name => 'Project Room')
		Venue.create(:name => 'Multipurpose Hall')
		Venue.create(:name => 'Table Tennis Room')
		Venue.create(:name => 'Volleyball Court')
		Venue.create(:name => 'Paddal Stadium')
		Venue.create(:name => 'NKN Room 208')
		Venue.create(:name => 'Lecture Hall 207')
		Venue.create(:name => 'Kamand')
	end
end