class EventsController < ApplicationController
  before_action :logged_in_user, only: [:show, :create, :edit, :destroy]

  def new
    @event = Event.new
    
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.event_date >= Date.today 
      if @event.save
        flash[:success] = "Event Saved!"
        @attendance = Attendance.new(attendee_id: params[:event][:creator_id].to_i, attended_event_id: @event.id)
        @attendance.save # make the creator as the first attendee

        redirect_to user_path(current_user)
      else
        flash[:warning] = "All field must be filled!"
        redirect_to user_path(current_user)
      end
    else
      flash[:warning] = "New Event's Date can't earlier than today!"
      redirect_to user_path(current_user)
    end

  end

  def index
    @events = Event.all
    @past_events = Event.previous_events
    @upcoming_events = Event.upcoming_events 
  end

  def show
    @event = Event.find_by(id: params[:id])
    @attendance = @event.attendances.build
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :event_date, :location, :creator_id)
  end


end
