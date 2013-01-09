class Team < ActiveRecord::Base
  belongs_to :event
  belongs_to :creator, :class_name => 'User'
  
  has_many :participations
  has_many :members, :class_name => 'User', :through => :participations
  attr_accessible :name, :size
end
