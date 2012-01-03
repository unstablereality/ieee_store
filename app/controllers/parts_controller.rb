class PartsController < ApplicationController
  def new
    @part = Part.new
  end
  def create
    @part = Part.new(params[:part])
    if (@part.save)
      redirect_to :parts
    else
      flash.alert = "Save Failed!"
      render :new
    end
  end
  def show
    @part = Part.find(params[:id])
  end
  def index
    @parts = Part.all
    @parts_kits = PartsKit.all
  end
  def edit
    @part = Part.find(params[:id])
  end
  def update
    @part = Part.find(params[:id])
    if (@part.update_attributes(params[:part]))
      redirect_to :parts
    else
      flash.alert = "Update Failed!"
      render :edit
    end
  end
  def destroy
    @part = Part.find(params[:id])
    if (@part.delete)
      flash.notice = "Part Successfully Deleted"
      redirect_to :parts      
    else
      flash.alert = "Destroy Failed!"
      redirect_to :parts
    end
  end
end
