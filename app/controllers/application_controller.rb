class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :load_user
  def load_user
    if session[:user_id]
      begin 
        @user = User.find(session[:user_id])
      rescue
        session[:user_id] = nil
        nil
      end

    else false
    end

  end

end
