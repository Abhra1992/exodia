class Team < ActiveRecord::Base
  belongs_to :event
  belongs_to :creator, :class_name => 'User'
  
  has_many :participations
  has_many :members, :class_name => 'User', :through => :participations, :source => :user
  attr_accessible :name, :size
  #Allow users to create team with event
  attr_accessible :event_id
  
  def max_size
    event.team_size
  end
  
  def Members
    members + [creator]
  end
end
