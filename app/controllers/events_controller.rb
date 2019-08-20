class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    
    if @event.save
      flash[:notice] = "Event Saved!"
      redirect_to root_url
    else
      flash.now[:error] = "Evnet Can't save!"
      render :new
    end

  end

  def index
    @events = Event.order(created_at: :desc)
  end

  def show
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
