class KitComponentsController < ApplicationController
  
  before_filter :is_admin

  def new
    @kit_component = KitComponent.new
  end
  
  def create
    @kit_component = KitComponent.new(params[:kit_component])
    @parts_kit = @kit_component.parts_kit
    if (@kit_component.save)
      redirect_to :back
    else
      flash.alert = "Save Failed!"
      redirect_to :back
    end
  end
  
  def edit
    @kit_component = KitComponent.find(params[:id])
  end
  
  def update
    @kit_component = KitComponent.find(params[:id])
    if (@kit_component.update_attributes(params[:kit_component]))
      redirect_to edit_parts_kit_path(@kit_component.parts_kit_id)
    else
      flash.alert = "Update Failed!"
      render :edit
    end
  end
  
  def destroy
    @kit_component = KitComponent.find(params[:id])
    if (@kit_component.delete)
      redirect_to :back
    else
      flash.alert = "Destroy Failed!"
      redirect_to :back
    end
  end
end
