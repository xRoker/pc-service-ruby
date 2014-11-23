class SubscribersController < ApplicationController

  before_action :load_user

  def subscribe
    Subscriber.subscribe @user.email
    redirect_to @user
  end

  def unsubscribe
    Subscriber.unsubscribe @user.email
    redirect_to @user
  end

  def load_user
    @user = User.find(session[:user_id])
  end

end