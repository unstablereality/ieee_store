class OrderReportsController < ApplicationController
  def new
    @parts_kits = PartsKit.order("name").all
  end
  
  def create
    @parts_kits = PartsKit.all
    redirect_to order_reports_path
  end
  
  def index
    @parts = Part.where(:deprecated => false).order("name").all
    @parts_kits = PartsKit.all
  end  
  
  def edit_class_size
    @parts_kits = PartsKit.all
    @parts_kits.each do |pk|
      pk.update_attribute(:class_size, 0)
    end
    unless params[:parts_kit_ids]
      redirect_to order_reports_path
    end
    @parts_kits = PartsKit.where(:id => params[:parts_kit_ids])
  end
  
  def update_class_size
    PartsKit.update(params[:parts_kits].keys, params[:parts_kits].values)
    redirect_to order_reports_path
  end
end
