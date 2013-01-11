class EventsController < ApplicationController
  before_filter :authenticate_contact!
  
  def venues_and_types
    @venues = Venue.all.map { |v| [v.name, v.id] }
    @types = EventType.all.map { |t| [t.name, t.id] }
  end  
  
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    venues_and_types
  end
  
  def create
    @event = Event.new(params[:event])
    if @event.save
      flash[:success] = "The event was successfully created"
      redirect_to events_path
    else
      flash[:error] = "There was an error saving the event"
      redirect_to new_event_path
    end
  end

  def edit
    venues_and_types
    @event = Event.find(params[:id])
  end
  
  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      flash[:success] = "The event changes were successfully saved"
      redirect_to event_path(@event)
    else
      flash[:error] = "There was an error saving the changes"
      redirect_to edit_event_path(@event)
    end
  end
  
  def destroy
  end
end
