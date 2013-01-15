class InsightsController < ApplicationController
  def list
    @insights = Event.insights
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
  end
end
