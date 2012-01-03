class PartsKitsController < ApplicationController
  before_filter :get_available_parts, :only => [:new,:edit]
  def new
    @parts_kit = PartsKit.new
  end
  def create
    @parts_kit = PartsKit.new(params[:parts_kit])
    if (@parts_kit.save)
      redirect_to edit_parts_kit_path(@parts_kit)
    else
      flash.alert = "Save Failed!"
      render :new
    end
  end
  def show
    @parts_kit = PartsKit.find(params[:id])
  end
  def index
    @parts_kits = PartsKit.all
  end
  def edit
    @parts_kit = PartsKit.find(params[:id])
  end
  def update
    @parts_kit = PartsKit.find(params[:id])
    if (@parts_kit.update_attributes(params[:parts_kit]))
      redirect_to :parts_kits
    else
      flash.alert = "Update Failed!"
      render :edit
    end
  end
  def destroy
    @parts_kit = PartsKit.find(params[:id])
    if (@parts_kit.delete)
      flash.notice = "Part Successfully Deleted"
      redirect_to :parts_kits    
    else
      flash.alert = "Destroy Failed!"
      redirect_to :parts_kits
    end
  end
  
  private 
    def get_available_parts
      @available_parts = Part.where(:deprecated=>false).order("name ASC").collect do |p|
        [p.id, "#{p.jameco_pn} #{p.name} #{p.description}"]
      end
    end
end
