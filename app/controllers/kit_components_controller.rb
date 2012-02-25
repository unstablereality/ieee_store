class KitComponentsController < ApplicationController
  
  before_filter :is_admin

  def new
    @kit_component = KitComponent.new
  end
  
  def create
    @kit_component = KitComponent.new(params[:kit_component])
    if (@kit_component.save)
      #redirect_to "/parts_kits/#{@kit_component.parts_kit_id}/edit"
      redirect_to :back
    else
      flash.alert = "Save Failed!"
      #redirect_to "/parts_kits/#{params[:id]}/edit"
      redirect_to :back
    end
  end
  
  def edit
    @kit_component = KitComponent.find(params[:id])
  end
  
  def update
    @kit_component = KitComponent.find(params[:id])
    if (@kit_component.update_attributes(params[:kit_component]))
      redirect_to "#{parts_kits_path}/#{@kit_component.parts_kit_id}/edit"
    else
      flash.alert = "Update Failed!"
      render :edit
    end
  end
  
  def destroy
    @kit_component = KitComponent.find(params[:id])
    if (@kit_component.delete)
      flash.notice = "KitComponent Successfully Deleted"
      redirect_to :back
    else
      flash.alert = "Destroy Failed!"
      redirect_to :back
    end
  end
end
