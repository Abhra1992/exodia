class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => :index
  
  def index
    if user_signed_in?
  		@notifications = current_user.notifications rescue []
		end
  end

  def notifications
  end
end
