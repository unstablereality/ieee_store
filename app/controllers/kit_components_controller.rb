class KitComponentsController < ApplicationController
  def new
    @kit_component = KitComponent.new
  end
  def create
    @parts_kit = PartsKit.find(params[:parts_kit_id])
    @kit_component = @parts_kit.kit_components.new()
    unless (@kit_component.save)
      flash.alert = "Add Component Failed!" 
    end
    redirect_to edit_parts_kit_path(@parts_kit)
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
    if (@kit_component.delete)
      flash.notice = "KitComponent Successfully Deleted"
      redirect_to :kit_components      
    else
      flash.alert = "Destroy Failed!"
      redirect_to :kit_components
    end
  end
end
