class SessionsController < ApplicationController
  
  before_filter :is_shopkeeper, :only => :index

  def new
  end
  
  #session created redirects to session show, basic landing page
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to sessions_path, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end
  
  def show
  end
=begin
  def index
    @sessions = sessions.all
  end
=end
  #when user logs out, session destroyed, redirect back to login
  
  def destroy
    session[:user_id] = nil
    redirect_to new_session_url, :notice => "Logged out!"
  end
end
