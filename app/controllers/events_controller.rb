class EventsController < ApplicationController
  before_filter :authenticate_contact!
  before_filter :venues_and_types, :only => [:new, :edit]
  before_filter :restrict_events
  
  def venues_and_types
    @venues = Venue.all.map { |v| [v.name, v.id] }
    @types = EventType.all.map { |t| [t.name, t.id] }
  end
  
  def restrict_events
    @events = current_contact.events
  end
  
  def index
  end

  def show
    @event = @events.find(params[:id])
  end

  def new
  end
  
  def create
    @event = @events.new(params[:event])
    if @event.save
      flash[:success] = "The event was successfully created"
      redirect_to events_path
    else
      flash[:error] = "There was an error saving the event"
      redirect_to new_event_path
    end
  end

  def edit
    @event = @events.find(params[:id])
  end
  
  def update
    @event = @events.find(params[:id])
    if @event.update_attributes(params[:event])
      flash[:success] = "The event changes were successfully saved"
      redirect_to event_path(@event)
    else
      flash[:error] = "There was an error saving the changes"
      redirect_to edit_event_path(@event)
    end
  end
  
  def destroy
    @event = @events.find(params[:id])
    if @event.destroy
	    flash[:success] = "Successfully deleted event."
	  else
	    flash[:error] = "Event could not be deleted. Please try again."
	  end
	  redirect_to :back
  end
end
