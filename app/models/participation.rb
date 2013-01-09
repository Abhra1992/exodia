class Participation < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  belongs_to :team
  attr_accessible :active, :level, :score
end
