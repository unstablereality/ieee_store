class KitComponentsController < ApplicationController
  def new
    @kit_component = KitComponent.new
  end
  
  def create
    @kit_component = KitComponent.new(params[:kit_component])
    if (@kit_component.save)
      redirect_to "/parts_kits/#{@kit_component.parts_kit_id}/edit"
    else
      flash.alert = "Save Failed!"
      render :new
    end
  end
  
  def show
    @kit_component = KitComponent.find(params[:id])
  end
  
  def index
    @kit_components = KitComponent.all
  end
  
  def edit
    @kit_component = KitComponent.find(params[:id])
  end
  
  def update
    @kit_component = KitComponent.find(params[:id])
    if (@kit_component.update_attributes(params[:kit_component]))
      redirect_to :kit_components
    else
      flash.alert = "Update Failed!"
      render :edit
    end
  end
  
  def destroy
    @kit_component = KitComponent.find(params[:id])
    @kit_id = @kit_component.parts_kit_id
    if (@kit_component.delete)
      flash.notice = "KitComponent Successfully Deleted"
      redirect_to "/parts_kits/#{@kit_id}/edit"
    else
      flash.alert = "Destroy Failed!"
      redirect_to "/parts_kits/#{@kit_id}/edit"
    end
  end
end
