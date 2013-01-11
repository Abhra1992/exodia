class EventType < ActiveRecord::Base
  has_many :events, :foreign_key => :type_id
  attr_accessible :name
  
  scope :contest, where(:name => ['Technical', 'Cultural', 'Online', 'Literary', 'Informal', 'Adventure & Gaming'])
	scope :insight, where(:name => ['Workshop', 'Guest Lecture', 'Exhibition', 'Special'])
end
