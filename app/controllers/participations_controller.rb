class ParticipationsController < ApplicationController
  before_filter :authenticate_user!
	before_filter :authenticate_contact!, :only => [:index]
	
	def index
		if user_signed_in?
		  flash[:warning] = "You are not allowed there."
			redirect_to root_path
		end
	end
	
	def create
	  if current_user.events.push(Event.find(params[:contest_id]))
  	  flash[:success] = "Successfully registered for event."
	  else
	    flash[:error] = "Registration failed. Please try again."
    end
	  redirect_to :back
	end
	
	def destroy
	  @participation = current_user.participations.find_by_event_id(params[:contest_id])
	  if @participation.destroy
	    flash[:success] = "Successfully cancelled registration for event."
	  else
	    flash[:error] = "Registration cancel failed. Please try again."
	  end
	  redirect_to :back
	end
end
