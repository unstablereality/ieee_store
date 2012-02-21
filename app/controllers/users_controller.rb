class UsersController < ApplicationController
  
  before_filter :is_admin, :except => [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      #placeholder redirect. Need to redirect to users index when it exists
      redirect_to :back, :notice => "User created!"
    else
      render "new"
    end
  end
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if (@user.update_attributes(params[:user]))
      if @current_user == "Administrator"
        redirect_to :users
      else
        flash.notice = "Password Successfully Changed"
        redirect_to sessions_path
      end
    else
      render :edit
    end
  
  end
  
  def destroy
  
  end
end
