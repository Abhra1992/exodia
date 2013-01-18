class ContestsController < ApplicationController
  def list
    @contests = Event.contests
		@participating = current_user.events rescue []
  end

  def index
    list
  end

  def show
    list
		if params[:id].nil?
			@event = Event.find_by_code(params[:code])
		else
			@event = Event.find(params[:id])
		end
		if user_signed_in?
  		@participation = current_user.participations.find_by_event_id(@event.id)
	  	@created_team = current_user.created_teams.find_by_event_id(@event.id)
		end
  end
end
