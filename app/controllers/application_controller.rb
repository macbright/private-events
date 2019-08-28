class ApplicationController < ActionController::Base
   include SessionsHelper
   include EventsHelper

    def log_in(user)
        session[:user_id] = user.id
    end

    
end
