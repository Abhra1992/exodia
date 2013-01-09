class Team < ActiveRecord::Base
  belongs_to :event
  belongs_to :creator
  attr_accessible :name, :size
end
