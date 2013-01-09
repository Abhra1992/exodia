class EventType < ActiveRecord::Base
  has_many :events, :foreign_key => :type_id
  attr_accessible :name
end
