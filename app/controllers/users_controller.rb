class UsersController < ApplicationController
  
  before_filter :is_admin, :except => [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      #placeholder redirect. Need to redirect to users index when it exists
      redirect_to :users, :notice => "User created!"
    else
      render "new"
    end
  end
  
  def index
    @users = User.find(:all, :conditions => ["id NOT IN (1)"], :order => 'name')
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
      flash.notice = "User Profile Successfully Updated"
      if (@current_user.security == "Administrator")
        redirect_to :users
      else
        redirect_to sessions_path
      end
    else
      render :edit
    end
  
  end
  
  def destroy
    @user = User.find(params[:id])
    if (@user.delete)
      flash.notice = "User Successfully Deleted"
      redirect_to :users      
    else
      flash.alert = "User Deletion Failed"
      redirect_to :users
    end
  end
end
