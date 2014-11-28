class SubscribersController < ApplicationController

  before_action :load_user

  def subscribe
    Subscriber.subscribe @user.id
    redirect_to @user
  end

  def unsubscribe
    Subscriber.unsubscribe @user.id
    redirect_to @user
  end

  def load_user
    @user = User.find(session[:user_id])
  end

end
