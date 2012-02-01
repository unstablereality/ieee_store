class TransactionPartsController < ApplicationController
  def new
    @transaction_part = TransactionPart.new
  end
  
  def create
    @transaction_part = TransactionPart.new(params[:transaction_part])
    begin
      if (@transaction_part.save)
        @transaction_part.update_attribute(:current_price, @transaction_part.part.student_price)
        @quantity = @transaction_part.part.quantity - @transaction_part.part_quantity
        @transaction_part.part.update_attribute(:quantity, @quantity)
        redirect_to :back
      else
        flash.alert = "Save Failed!"
        render :new
      end
    rescue 
      flash.alert = "Couldn't Add Item"
    end
  end
  
  def show
    @transaction_part = TransactionPart.find(params[:id])
  end
  
  def index
    @transaction_parts = TransactionPart.all
  end
  
  def edit
    @transaction_part = TransactionPart.find(params[:id])
  end
  
  def update
    @transaction_part = TransactionPart.find(params[:id])
    if (@transaction_part.update_attributes(params[:transaction_part]))
      redirect_to "/transactions/#{@transaction_part.transaction_id}/edit"
    else
      flash.alert = "Update Failed!"
      render :edit
    end
  end
  
  def destroy
    @transaction_part = TransactionPart.find(params[:id])
    if (@transaction_part.destroy)
      flash.notice = "TransactionPart Successfully Deleted"
    else
      flash.alert = "Destroy Failed!"
    end
    redirect_to "/transactions/#{@transaction_part.transaction_id}/edit"
  end
end
