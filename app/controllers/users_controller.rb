class UsersController < ApplicationController
  def new
    @user = User.new
  end

   def create
     @user = User.new(user_params)
     if @user.save
      flash[:notice] = 'User created'
      redirect_to root_url
     else 
      render 'new'
     end
  end

  def show
    if logged_in?
      @user = current_user
      @total_events =@user.attended_events.count
      @event = @user.events.build
      @events = @user.events.all
      @attendance = Attendance.new
    end
  end

  private 
    def  user_params
      params.require(:user).permit(:name, :email)
    end 
end
