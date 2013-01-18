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
      t.name = ''
      t.creator = current_user
      t.event = Event.find(params[:contest_id])
      if t.save
        
      else
      
      end
    end
  end
  
  def edit
  
  end
  
  def update
  
  end
  
  def destroy
  
  end
end
