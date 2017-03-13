class EventsController < ApplicationController

  def index
    @events = []
    @category_ids = []
    if params[:name]
      @events = Event.where("name like ?", "%#{params[:name]}%").where(active: true)
    elsif params[:categories]
      params[:categories].each do |category_id|
        category = Category.find_by(id: category_id.to_i)
        @event.category_ids << category.id
        Event.all.each do |event|
          @events << event if event.categories.include?(category) && event.active
        end
      end
      @events.uniq!
    else
      Event.all.each do |event|
        @events << event if event.active
      end
    end
  end

  def new
    @event = Event.new
    @business = current_business
  end

  def create
    @event = Event.new(event_params)
    time = params.require(:event).permit(:datetime)
    @event.datetime = format_datetime(time[:datetime])
    @event.business = current_business
    @event.active = true
    category_params.each do |cat_id|
      cat = Category.find_by(id: cat_id)
      @event.categories << cat if !!cat
    end
    if !@event.save
      byebug
      render 'events/new'
    else
      redirect_to events_path
    end
  end

  def show

    @event = Event.find_by(id: params[:id])
    if is_logged_in?
      @rsvp = Rsvp.find_by(event_id: @event.id, member_id: current_member.id)
    end
  end

  def rsvp
    @event = Event.find_by(id: params[:id])
    @member = current_member
    @event.check_capacity
    if @event.active
      Rsvp.find_or_create_by(member_id: @member.id, event_id: @event.id)
      flash[:alert] = "RSVP successful. Event has been added to your calendar"
      redirect_to @event
    else
      flash[:alert] = "There was an error RSVPing - The Event is no longer active"
      render '/events/show'
    end
  end

  def destroy
    Event.find_by(id: params[:id]).destroy
    redirect_to events_path
  end

  def destroy_rsvp
    @event = Event.find_by(id: params[:event_id])
    @rsvp = Rsvp.find_by(id: params[:id])
    @rsvp.destroy
    flash[:alert] = "You have successfully cancelled"
    redirect_to event_path(@event)
  end


  private

  def format_datetime(time)
    time = time[0...-3].split
    splat = time[0].split('/')
    splat.unshift(splat.pop)
    time[0] = splat.join('-')
    time = time.join(' ')
  end

  def event_params
    params.require(:event).permit(:name, :description, :price, :price_description, :capacity)
  end

  def category_params
    params.require(:categories)
  end



end
