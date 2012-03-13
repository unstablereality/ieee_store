class OrderReportController < ApplicationController
  def new
    @parts_kits = PartsKit.order("name").all
  end
  
  def create
    redirect_to order_report_index_path
  end
  
  def index
    @parts = Part.where(:deprecated => false).order("name").all
    @kit_quantity = params[:quantity]
  end  
end
