class Event < ActiveRecord::Base
  belongs_to :venue
  belongs_to :type
  attr_accessible :code, :description, :end, :judging, :name, :rounds, :rules, :start, :submit_to, :team
end
