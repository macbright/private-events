class AttendancesController < ApplicationController
  def new
    @attendance = Attendance.new
  end

  def create
    @attendance = Attendance.new(attendance_params)
    @future_event = @event.event_date.day >= Date.today.day && @event.event_date.month >= Date.today.month
    if @future_event 
      @attendance == true
    else 
      @attendance == false
    end
    if @attendance.save
      flash[:success] = "You attended this event!"
      redirect_to root_path
    else
      flash[:warning] = "the event has already passed"
      redirect_to event_path
    end
  end

  private
    def attendance_params
      params.require(:attendance).permit(:attendee_id, :attended_event_id)
    end

end
