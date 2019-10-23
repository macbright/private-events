class EventsController < ApplicationController
  before_action :logged_in_user, only: [:show, :create, :edit, :destroy]

  def new
    @event = Event.new
    
  end

  def create
    @event = current_user.events.build(event_params)
    if !@event.event_date.nil? && @event.event_date >= Date.today 
      if @event.save
        flash[:success] = "Event Saved!"
        @attendance = Attendance.new(attendee_id: params[:event][:creator_id].to_i, attended_event_id: @event.id)
        @attendance.save # make the creator as the first attendees
        redirect_to user_path(current_user)
      else
        # redirect_to user_path(current_user)
        render "new"
      end
    else
      flash[:warning] = "New Event's Date can't earlier than today! or can't be blank"
      redirect_to user_path(current_user)
    end

  end

  
  def index
    @events = Event.all
    @past_events = Event.previous_events
    @upcoming_events = Event.upcoming_events 
  end 


  def edit
    @event = Event.find_by(id: params[:id])
    @events = Event.all
  end

  def update
    @event = Event.find_by(id: params[:id])
    @events = Event.all
    if @event.update(event_params)
      flash[:success] = 'Event updated'
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find_by(id: params[:format])
    flash[:danger] = 'Event Deleted!' if @event.destroy
    redirect_to user_path(current_user)
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
