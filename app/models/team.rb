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
  
  def add_member(user)
    if event.participants.include? user and size < max_size
      members.push(user)
      size += 1
    else
    
    end    
  end
  
  def remove_member(user)
    if team.members.include? user and size > 1 and user != creator
      members.delete(user)
      size -= 1
    end
  end
  
  def empty_slots
    max_size - size
  end
  
  def Members
    members + [creator]
  end
end
