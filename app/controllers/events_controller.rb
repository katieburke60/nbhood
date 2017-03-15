class EventsController < ApplicationController

  def index
    # @category_ids = params[:categories]
    if !params[:name].blank?
      @events = Event.where("name like ?", "%#{params[:name]}%").where(active: true)
    end
    if params[:categories]
      params[:categories].map do |category_id|
        category_id.to_i
      end
      @events_cat = Event.joins(:event_categories).where("category_id = ?", params[:categories][0]).or(Event.joins(:event_categories).where("category_id = ?", params[:categories][1])).or(Event.joins(:event_categories).where("category_id = ?", params[:categories][2])).or(Event.joins(:event_categories).where("category_id = ?", params[:categories][3])).or(Event.joins(:event_categories).where("category_id = ?", params[:categories][4])).or(Event.joins(:event_categories).where("category_id = ?", params[:categories][5]))
    end
    if @events_cat && !@events
      @events = @events_cat.uniq
    elsif @events_cat && @events
      @events.map do |event|
        event if @events_cat.include?(event)
      end
    end

    if !@events
      @events = []
      Event.all.each do |event|
        @events << event if event.active
      end
      if params[:name] || params[:categories]
        flash[:alert] = "No Results were found"
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
      rsvp = Rsvp.find_or_create_by(member_id: @member.id, event_id: @event.id)
      rsvp.committed = true
      rsvp.save
      flash[:alert] = "RSVP successful. Event has been added to your calendar"
      redirect_to @event
    else
      flash[:alert] = "There was an error RSVPing - The Event is no longer active"
      render '/events/show'
    end
  end

  def interest
    @event = Event.find_by(id: params[:id])
    @member = current_member
    @event.check_capacity
    if @event.active
      interest = Rsvp.find_or_create_by(member_id: @member.id, event_id: @event.id)
      interest.committed = false
      interest.save
      flash[:alert] = "You have registered your interest. #{@event.name} has been added to your calendar. Please switch to RSVP anytime to ensure you are able to get in."
      redirect_to @event
    else
      flash[:alert] = "There was an error registering your interest - The Event is no longer active"
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

  def destroy_interest
    @event = Event.find_by(id: params[:event_id])
    @interest = Rsvp.find_by(id: params[:id])
    @interest.destroy
    flash[:alert] = "You have successfully cancelled"
    redirect_to event_path(@event)
  end


  def category
    @category = Category.find_by(id: params[:category_id])
    if @category
      @events = @category.events
    else
      redirect_to events_path, alert: "This category does not exist"
    end
  end

  def followers
    @businesses = current_member.businesses
    @events = []
    @businesses.each do |business|
      business.events.each do |event|
        @events << event if event.active
      end
    end
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
