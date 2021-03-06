# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionsHelper
  include EventsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def logged_in_user
    return if logged_in?

    flash[:danger] = 'Please log in.'
    redirect_to login_url
  end
end
