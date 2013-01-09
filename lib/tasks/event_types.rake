require 'faker'
namespace :db do
  desc "Create event types in database"
  task :event_types => :environment do
		EventType.create(:name => 'Technical')
		EventType.create(:name => 'Cultural')
		EventType.create(:name => 'Literary')
		EventType.create(:name => 'Online')
		EventType.create(:name => 'Informal')
		EventType.create(:name => 'Adventure & Gaming')
		EventType.create(:name => 'Workshop')
		EventType.create(:name => 'Guest Lecture')
		EventType.create(:name => 'Special')
	end
end
