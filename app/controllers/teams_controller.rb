class TeamsController < ApplicationController
  before_filter :authenticate_user!
	before_filter :authenticate_contact!, :only => [:index]
	
	def index
	  
	end
	
	def show
	
	end
	
	def new
	  @contest_id = params[:contest_id]
	end
  
  def create
    Team.new do |t|
      t.name = params[:team][:name]
      t.creator = current_user
      t.event = Event.find(params[:contest_id])
      if t.save
        flash[:success] = "Successfully created team."        
      else
        flash[:error] = "Creation failed. Please try again."
      end
    end
    redirect_to :back
  end
  
  def edit
    @team = current_user.created_teams.find_by_event_id(params[:contest_id])
  end
  
  def update
  
  end
  
  def destroy
  
  end
end
