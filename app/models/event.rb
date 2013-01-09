class Event < ActiveRecord::Base
  belongs_to :venue
  belongs_to :type, :class_name => 'EventType'
  
  has_and_belongs_to_many :contacts, :join_table => :events_contacts
	has_many :participations
	has_many :participants, :class_name => 'User', :through => :participations, :source => :user
	
  attr_accessible :code, :description, :end, :judging, :name, :rounds, :rules, :start, :submit_to, :team
end
