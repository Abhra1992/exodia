class Event < ActiveRecord::Base
  belongs_to :venue
  belongs_to :type, :class_name => 'EventType'
  
  has_and_belongs_to_many :contacts, :join_table => :events_contacts
	has_many :participations
	has_many :participants, :class_name => 'User', :through => :participations, :source => :user
	
  attr_accessible :code, :description, :end, :judging, :name, :rounds, :rules, :start, :submit_to, :team
  # Allow contacts to create event with type and venue
  attr_accessible :type_id, :venue_id
  
  validates :name, :code, :presence => true, :uniqueness => true
	validates :description, :start, :end, :submit_to, :presence => true
	
	def Description
	  Kramdown::Document.new(description).to_html
	end
	
	def Rules
	  Kramdown::Document.new(rules).to_html
	end
	
	def Type
	  type.name
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
	
	def self.insights
	  insights = {}
	  EventType.insight.each do |t|
			insights[t.name] = t.events
		end
		insights
	end
end
