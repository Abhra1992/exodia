class Event < ActiveRecord::Base
  belongs_to :venue
  belongs_to :type, :class_name => 'EventType'
  
  has_and_belongs_to_many :contacts, :join_table => :events_contacts
	has_many :participations
	has_many :participants, :class_name => 'User', :through => :participations, :source => :user
	has_many :teams
	
  attr_accessible :code, :description, :end, :judging, :name, :rounds, :rules, :start, :submit_to, :team_size
  # Allow contacts to create event with type and venue
  attr_accessible :type_id, :venue_id
  
  validates :name, :code, :presence => true, :uniqueness => true
	validates :description, :start, :end, :submit_to, :presence => true
	validates :rounds, :team_size, :numericality => {:only_integer => true}
	
	def team_event?
	  team_size > 1
	end
	
	def Type
	  type.name
	end
	
	def Contacts
	  contacts.map do |c|
	    [c.name, c.phone, c.email]
	  end
	end
	
	def self.by_type
		events = {}
		EventType.all.each do |t|
			events[t.name] = t.events
		end
		events
	end
	
	def self.contests
	  contests = {}
	  EventType.contest.each do |t|
			contests[t.name] = t.events
		end
		contests
	end
	
	def self.contests_list
	  EventType.contest.map(&:events).inject(:+)
	end
	
	def self.insights
	  insights = {}
	  EventType.insight.each do |t|
			insights[t.name] = t.events
		end
		insights
	end
	
	def self.insights_list
	  EventType.insight.map(&:events).inject(:+)
	end
end
