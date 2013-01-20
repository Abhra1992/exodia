class Participation < ActiveRecord::Base
  after_create :send_mail

  belongs_to :user
  belongs_to :event
  belongs_to :team
  attr_accessible :active, :level, :score
  
  private
  def send_mail
    ExodiaMailer.participate_email(user, event).deliver rescue nil
  end
end
