class InsightsController < ApplicationController
  before_filter :list, :only => [:index, :show]
  
  def list
    @insights = Event.insights
  end
  
  def index
  end

  def show
		if params[:id].nil?
			@event = Event.find_by_code(params[:code])
		else
			@event = Event.find(params[:id])
		end
  end
end
