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
    @team = current_user.created_teams.new(:event_id => params[:contest_id], :name => params[:team][:name])
    if @team.save
      flash[:success] = "Successfully created team."     
    else
      flash[:error] = "Creation failed. Please try again."
    end
    redirect_to edit_contest_team_path(params[:contest_id])
  end
  
  def edit
    @team = current_user.created_teams.find_by_event_id(params[:contest_id])
  end
  
  def update
    @team = current_user.created_teams.find_by_event_id(params[:contest_id])
    @team.update_attributes(params[:team])
  end
  
  def destroy
  
  end
end
