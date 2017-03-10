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
    @member = current_user
    if @event.active
      Rsvp.create(member_id: @member.id, event_id: @event.id)
      flash[:message] = "RSVP successful. Event has been added to your calendar"
      redirect_to @event
    else
      flash[:message] = "There was an error RSVPing - The Event is no longer active"
      render '/events/show'
    end

  end
end
