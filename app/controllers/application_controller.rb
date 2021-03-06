class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :current_user

  rescue_from Errors::InsufficientSupplyError, :with => :supply_error
  
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def get_security
    if session[:user_id]
      @security = User.find(session[:user_id]).security
    else
      @security = nil
    end
    @security
  end
  
  def is_admin
    unless get_security.eql?("Administrator")
      if @current_user
        flash.notice = "Insufficient Priveleges.  Please contact an administrator."
        redirect_to sessions_path
      else
        redirect_to new_session_path
      end
    end
  end
  
  def is_shopkeeper
    unless get_security.eql?("Shopkeeper") || get_security.eql?("Administrator")
      if @current_user
        flash.notice = "Insufficient Priveleges.  Please contact an administrator."
        redirect_to sessions_path
      else
        redirect_to new_session_path
      end
    end
  end
  
  def supply_error(error)
    flash.notice = error.message
    redirect_to :back
  end

  helper_method :current_user
end
