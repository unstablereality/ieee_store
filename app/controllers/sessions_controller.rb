class SessionsController < ApplicationController
  def new
  end
  #session created redirects to session show, basic landing page
  def create
    redirect_to "sessions/show"
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
    redirect_to root_url
  end
end
