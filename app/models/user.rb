class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :participations
	has_many :events, :through => :participations
	has_many :teams, :through => :participations
	
	has_many :created_teams, :class_name => 'Team', :foreign_key => :creator_id
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :birthdate, :firstname, :lastname, :phone, :school, :username
  
  def name
    "%s %s" % [firstname, lastname]
  end
end
