class UsersController < ApplicationController
  def new
    @user = User.new
  end

   def create
     @user = User.new(user_params)
     if @user.save
      log_in @user
      flash[:success] = 'Welcome to private-event'
      redirect_to root_url
     else 
      render 'new'
     end
  end

  def show
    if logged_in?
      @total_events = current_user.attended_events.count
      @event = current_user.events.build
      @events = current_user.events.all
      @attendance = Attendance.new
    end
  end

  private 
    def  user_params
      params.require(:user).permit(:name, :email)
    end 
end
