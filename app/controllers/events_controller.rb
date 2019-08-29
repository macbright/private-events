class EventsController < ApplicationController
  def new
    @event = Event.new
    @user = current_user
    @future_event = future_event?
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "Event Saved!"
      redirect_to events_path
    else
      flash[:warning] = "All field must be filled!"
      render :root_url
    end
  end

  def index
    @events = Event.all
    @past_events = Event.previous_events
    @upcoming_events = Event.upcoming_events
    @user = current_user
    @attendance = Attendance.new
  end

  def show
    @event = Event.find_by(id: params[:id])
    @a_array = @event.attendees.ids
    @user = current_user
    @attendance = Attendance.new
  end

  def edit
  end

  def destroy
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :event_date, :location, :creator_id)
  end

  

end
