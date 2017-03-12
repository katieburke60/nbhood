class EventsController < ApplicationController

  def index
    @events = []
    if params[:name]
      @events = Event.where("name like ?", "%#{params[:name]}%")
    else
      Event.all.each do |event|
        @events << event if event.active
      end
    end
  end

  def show
    @event = Event.find_by(id: params[:id])
  end

  def rsvp
    @event = Event.find_by(id: params[:id])
    # byebug
    @member = current_member
    @event.check_capacity
    if @event.active
      Rsvp.find_or_create_by(member_id: @member.id, event_id: @event.id)
      flash[:message] = "RSVP successful. Event has been added to your calendar"
      redirect_to @event
    else
      flash[:message] = "There was an error RSVPing - The Event is no longer active"
      render '/events/show'
    end
  end
end
